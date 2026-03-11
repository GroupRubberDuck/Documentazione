import re, json, csv, os
from datetime import datetime, date
from collections import defaultdict

# ─── CONFIGURAZIONE ───────────────────────────────────────────────────────────
SPRINT_DIR            = "../../../Piano_di_Progetto/content/05-pianificazione_breve_periodo/sprints"
SPRINT_CSV            = "sprint.csv"
TARIFFA_FILE          = "costi_ruoli.json"
OUTPUT_DIR            = "."
BAC_FISSO             = 11610
SETTIMANE_PIANIFICATE = 18

# MPC-09 RSI: aggiornare manualmente a ogni sprint se i requisiti cambiano.
# Formato: { sprint_num: (NR, NTR) }
#   NR  = numero di requisiti modificati/aggiunti/rimossi in quel sprint
#   NTR = numero totale di requisiti a fine sprint
# Formula doc: RSI = 1 - (NR / NTR)
# Lasciare vuoto ({}) per saltare l'export RSI (dati non disponibili).
RSI_DATA: dict = {
    # Esempio: 1: (0, 50),   # sprint 1: 0 modifiche su 50 requisiti totali
}
SPRINT_BOUNDARIES = [
    (date(2025, 11, 25), 1),
    (date(2025, 12,  8), 2),
    (date(2025, 12, 23), 3),
    (date(2026,  2,  4), 4),
    (date(2026,  2, 18), 5),
    (date(2026,  3, 10), 6),
]

DATE_FORMATS = ['%Y-%m-%d', '%b %d, %Y', '%d/%m/%Y', '%Y-%d-%m']


# ─── UTILITIES ────────────────────────────────────────────────────────────────

def parse_date(s: str):
    s = s.strip()
    if not s or s == '-':
        return None
    for fmt in DATE_FORMATS:
        try:
            return datetime.strptime(s, fmt).date()
        except ValueError:
            continue
    return None


def infer_sprint(row: dict):
    for key in row:
        if key.strip().lower() == 'sprint':
            try:
                return int(row[key].strip())
            except ValueError:
                pass
    end_raw = row.get('End date', row.get('end date', row.get('End Date', ''))).strip()
    d = parse_date(end_raw)
    if d is None:
        return None
    for boundary, sprint_num in SPRINT_BOUNDARIES:
        if d <= boundary:
            return sprint_num
    return SPRINT_BOUNDARIES[-1][1]


def has_author(row: dict, autore_col: str) -> bool:
    if not autore_col:
        return False
    val = row.get(autore_col, '').strip()
    return bool(val) and val not in ('-', '')


def extract_balanced_parens(content: str, keyword: str) -> str:
    idx = content.find(keyword)
    if idx == -1:
        return ""
    open_idx = content.find('(', idx + len(keyword))
    if open_idx == -1:
        return ""
    depth = 0
    for i in range(open_idx, len(content)):
        if content[i] == '(':
            depth += 1
        elif content[i] == ')':
            depth -= 1
            if depth == 0:
                return content[open_idx + 1:i]
    return ""


# ─── LETTURA DATI ─────────────────────────────────────────────────────────────

def load_sprint_blocks_from_files(sprint_dir: str) -> list:
    """Legge i blocchi oreProduttive da sprint-N.typ."""
    blocks = []
    i = 1
    while True:
        path = os.path.join(sprint_dir, f"sprint-{i}.typ")
        if not os.path.exists(path):
            break
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
        block = extract_balanced_parens(content, "oreProduttive")
        if block.strip():
            blocks.append(block)
            print(f"   ✅ sprint-{i}.typ: blocco oreProduttive trovato")
        else:
            blocks.append("")
            print(f"   ⚠️  sprint-{i}.typ: nessun blocco oreProduttive trovato")
        i += 1
    print(f"   📋 File sprint trovati: {i - 1}")
    return blocks


def load_task_data_per_sprint(sprint_csv_path: str) -> dict:
    """
    Legge sprint.csv e restituisce per ogni sprint un dict con:
      - 'done':     task completate (hanno autore)
      - 'total':    task totali dello sprint
      - 'ev_ratio': done / total  → usato per il calcolo dell'EV (MPC-02)

    Nota: una task è considerata "completata in tempo" (MPC-15) se ha un autore
    e la sua End date rientra nella finestra del rispettivo sprint.
    """
    rows = []
    with open(sprint_csv_path, 'r', encoding='utf-8') as f:
        sample = f.read(4096)
        f.seek(0)
        sep = '\t' if sample.count('\t') > sample.count(',') else ','
        reader = csv.DictReader(f, delimiter=sep)
        for row in reader:
            rows.append({k.strip(): v.strip() for k, v in row.items() if k and v is not None})

    if not rows:
        print("⚠️  sprint.csv è vuoto!")
        return {}

    print(f"   📋 Totale task: {len(rows)}")
    print(f"   📋 Colonne:     {list(rows[0].keys())}")

    autore_col = next((k for k in rows[0].keys() if 'autor' in k.lower()), None)
    print(f"   📋 Colonna autore rilevata: '{autore_col}'")

    by_sprint = defaultdict(list)
    no_sprint = 0
    for row in rows:
        sp = infer_sprint(row)
        if sp is not None:
            by_sprint[sp].append(row)
        else:
            no_sprint += 1

    if no_sprint:
        print(f"   ⚠️  {no_sprint} task senza End date valida → ignorate")

    print(f"   📋 Task per sprint: { {k: len(v) for k, v in sorted(by_sprint.items())} }")

    result = {}
    for sp, sp_rows in sorted(by_sprint.items()):
        total    = len(sp_rows)
        done     = sum(1 for r in sp_rows if has_author(r, autore_col))
        ev_ratio = done / total if total > 0 else 0.0
        result[sp] = {'done': done, 'total': total, 'ev_ratio': ev_ratio}
        print(f"   Sprint {sp}: {done}/{total} task completate = {ev_ratio:.1%}")

    return result


# ─── CALCOLO E EXPORT ─────────────────────────────────────────────────────────

def update_metrics():
    # 1. Tariffe ruoli
    if not os.path.exists(TARIFFA_FILE):
        default_tariffe = {
            "Responsabile": 30, "Amministratore": 20, "Analista": 25,
            "Progettista": 25, "Programmatore": 15, "Verificatore": 15,
        }
        with open(TARIFFA_FILE, 'w', encoding='utf-8') as f:
            json.dump(default_tariffe, f, indent=4)
        print(f"ℹ️  Creato {TARIFFA_FILE} con tariffe di default.")

    with open(TARIFFA_FILE, 'r', encoding='utf-8') as f:
        tariffe = json.load(f)

    # 2. Blocchi ore da sprint-N.typ
    if not os.path.isdir(SPRINT_DIR):
        print(f"❌ Cartella sprint non trovata: {SPRINT_DIR}")
        return
    print("\n🔍 Lettura file sprint:")
    blocks = load_sprint_blocks_from_files(SPRINT_DIR)
    if not blocks:
        print("❌ Nessun file sprint-N.typ trovato.")
        return

    # 3. Dati task da sprint.csv
    if not os.path.exists(SPRINT_CSV):
        print(f"❌ {SPRINT_CSV} non trovato in {os.path.abspath(SPRINT_CSV)}")
        return
    print("\n🔍 Analisi sprint.csv:")
    task_data = load_task_data_per_sprint(SPRINT_CSV)
    if not task_data:
        print("❌ Nessun dato task calcolato. Controlla sprint.csv e SPRINT_BOUNDARIES.")
        return

    # 4. Calcolo metriche cumulative per sprint
    num_sprints = max(len(blocks), max(task_data.keys(), default=0), len(SPRINT_BOUNDARIES))

    data_points = []
    cum_pv = cum_ac = cum_ev = 0
    cum_ore_prev = cum_ore_eff = 0

    print(f"\n📊 Calcolo metriche ({num_sprints} sprint totali):")

    for i in range(1, num_sprints + 1):
        s_pv = s_ac = s_ore_prev = s_ore_eff = 0
        block = blocks[i - 1] if i <= len(blocks) else ""

        if not block:
            print(f"  ⚠️  Sprint {i}: nessun blocco oreProduttive → PV=0, AC=0")

        # Parse voci ore dal blocco .typ
        for entry in re.findall(r"\(([^()]+)\)", block):
            entry = entry.replace('\n', ' ').strip()
            r_m = re.search(r"ruolo:\s*ruoli\.(\w+)", entry)
            p_m = re.search(r"orePreviste:\s*(\d+)", entry)
            e_m = re.search(r"oreEffettive:\s*(\d+)", entry)
            if r_m and p_m and e_m:
                ruolo = r_m.group(1)
                prev  = int(p_m.group(1))
                eff   = int(e_m.group(1))
                costo = tariffe.get(ruolo, 0)
                s_pv       += prev * costo   # PV sprint = Σ(ore previste × tariffa)
                s_ac       += eff  * costo   # AC sprint = Σ(ore effettive × tariffa)
                s_ore_prev += prev
                s_ore_eff  += eff

        # EV sprint = PV sprint × % task completate  (proxy: task con autore / totali)
        sp_data  = task_data.get(i, {'done': 0, 'total': 0, 'ev_ratio': 0.0})
        ev_ratio = sp_data['ev_ratio']
        s_ev     = s_pv * ev_ratio

        # Accumulo cumulativo
        cum_pv         += s_pv
        cum_ac         += s_ac
        cum_ev         += s_ev
        cum_ore_prev   += s_ore_prev
        cum_ore_eff    += s_ore_eff

        # ── Metriche di Fornitura (MPC-01..08) ────────────────────────────────

        # MPC-01 PV  → cum_pv  (valore pianificato: 0 ≤ PV ≤ BAC)
        # MPC-02 EV  → cum_ev  (valore guadagnato: ideale ≥ PV)
        # MPC-03 AC  → cum_ac  (costo reale: ideale ≤ EV)

        # MPC-04 SPI = EV / PV  (≥ 0.9 accettabile, ≥ 1.0 ottimo)
        spi = cum_ev / cum_pv if cum_pv > 0 else 1.0

        # MPC-05 CPI = EV / AC  (≥ 0.9 accettabile, ≥ 1.0 ottimo)
        cpi = cum_ev / cum_ac if cum_ac > 0 else 1.0

        # MPC-06 EAC = BAC / CPI  (≤ 1.1×BAC accettabile, ≤ BAC ottimo)
        eac = BAC_FISSO / cpi if cpi > 0 else BAC_FISSO

        # MPC-08 ETC = EAC - AC  (≤ (BAC-AC)×1.1 accettabile)
        etc = max(0, eac - cum_ac)

        # MPC-07 TCPI = (BAC - EV) / (BAC - AC)  (∼1.0 accettabile, ≤1.0 ottimo)
        tcpi_denom = BAC_FISSO - cum_ac
        tcpi = (BAC_FISSO - cum_ev) / tcpi_denom if tcpi_denom > 0 else 1.0

        # Varianze (derivate, non metriche doc standalone ma utili nei grafici)
        sv = cum_ev - cum_pv   # Schedule Variance = EV - PV
        cv = cum_ev - cum_ac   # Cost Variance     = EV - AC

        # ── Metriche di Sviluppo (MPC-09) ─────────────────────────────────────

        # MPC-09 RSI = 1 - (NR / NTR)  (≥ 0.7 accettabile, 1.0 ottimo)
        # Dato inserito manualmente in RSI_DATA perché non ricavabile da sprint.csv
        rsi_entry = RSI_DATA.get(i)
        if rsi_entry:
            nr, ntr = rsi_entry
            rsi = round(1.0 - (nr / ntr), 3) if ntr > 0 else 1.0
        else:
            rsi = ''   # dato non disponibile per questo sprint

        # ── Metriche di Processo (MPC-14, MPC-15) ─────────────────────────────

        # MPC-14 Time Efficiency = Ore produttive / Ore totali
        # ore previste ≈ ore produttive (pianificate), ore effettive ≈ ore totali impiegate
        # (≥ 80% accettabile, ≥ 100% ottimo)
        time_efficiency = cum_ore_prev / cum_ore_eff if cum_ore_eff > 0 else 1.0

        # ── Metrica interna (non in doc) ──────────────────────────────────────
        # Stima settimane a completamento basata su SPI
        time_eac = SETTIMANE_PIANIFICATE / spi if spi > 0 else SETTIMANE_PIANIFICATE

        data_points.append({
            'Sprint':               f"Sprint {i}",
            'PV':                   round(cum_pv),                      # MPC-01
            'EV':                   round(cum_ev),                      # MPC-02
            'AC':                   round(cum_ac),                      # MPC-03
            'SPI':                  round(spi, 3),                      # MPC-04
            'CPI':                  round(cpi, 3),                      # MPC-05
            'EAC':                  round(eac),                         # MPC-06
            'TCPI':                 round(tcpi, 3),                     # MPC-07
            'ETC':                  round(etc),                         # MPC-08
            'RSI':                  rsi,                                # MPC-09
            'SV':                   round(sv),
            'CV':                   round(cv),
            'TimeEfficiency':       round(time_efficiency, 3),          # MPC-14
            'TimeEAC':              round(time_eac, 2),                 # interno
        })

        print(
            f"  Sprint {i}: PV={cum_pv:.0f}€  EV={cum_ev:.0f}€  AC={cum_ac:.0f}€ | "
            f"SPI={spi:.3f}  CPI={cpi:.3f}  EAC={eac:.0f}€ | "
            f"TimeEff={time_efficiency:.1%}"
            + (f"  RSI={rsi}" if rsi != '' else "  RSI=N/A")
        )

    # 5. Export CSV — nomi file esistenti nel progetto
    csv_map = [
        ('01-planned_value.csv',                 'PV'),                    # MPC-01
        ('02-earned_value.csv',                  'EV'),                    # MPC-02
        ('03-actual_cost.csv',                   'AC'),                    # MPC-03
        ('04-schedule_performance_index.csv',    'SPI'),                   # MPC-04
        ('05-cost_performance_index.csv',        'CPI'),                   # MPC-05
        ('06-estimate_at_completion.csv',        'EAC'),                   # MPC-06
        ('07-to_complete_performance_index.csv', 'TCPI'),                  # MPC-07
        ('08-estimate_to_complete.csv',          'ETC'),                   # MPC-08
        ('09-requirements_stability.csv',        'RSI'),                   # MPC-09
        ('09-cost_variance.csv',                 'CV'),                    # MPC (CV)
        ('10-schedule_variance.csv',             'SV'),                    # MPC (SV)
        ('14-time_efficiency.csv',               'TimeEfficiency'),        # MPC-14
        ('15-process_lead_time.csv',             'TimeEAC'),               # interno
    ]

    print()
    for filename, key in csv_map:
        filepath = os.path.join(OUTPUT_DIR, filename)
        with open(filepath, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['Sprint', key])
            for d in data_points:
                writer.writerow([d['Sprint'], d[key]])
        print(f"💾 Aggiornato: {filename}")

    print("\n✅ Tutte le metriche aggiornate con successo.")


if __name__ == "__main__":
    update_metrics()