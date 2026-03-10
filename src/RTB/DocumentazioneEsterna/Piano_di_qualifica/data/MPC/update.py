import re, json, csv, os
from datetime import datetime, date
from collections import defaultdict

# CONFIGURAZIONE PERCORSI E COSTI
SPRINT_DIR   = "../../../Piano_di_Progetto/content/05-pianificazione_breve_periodo/sprints"
SPRINT_CSV   = "sprint.csv"
TARIFFA_FILE = "costi_ruoli.json"
OUTPUT_DIR   = "."
BAC_FISSO             = 11610
SETTIMANE_PIANIFICATE = 18

SPRINT_BOUNDARIES = [
    (date(2025, 11, 25), 1),
    (date(2025, 12,  8), 2),
    (date(2025, 12, 23), 3),
    (date(2026,  2,  4), 4),
    (date(2026,  2, 18), 5),
]

DATE_FORMATS = ['%Y-%m-%d', '%b %d, %Y', '%d/%m/%Y', '%Y-%d-%m']


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


def load_completed_ratio_per_sprint(sprint_csv_path: str) -> dict:
    rows = []
    with open(sprint_csv_path, 'r', encoding='utf-8') as f:
        sample = f.read(4096); f.seek(0)
        sep = '\t' if sample.count('\t') > sample.count(',') else ','
        reader = csv.DictReader(f, delimiter=sep)
        for row in reader:
            rows.append({k.strip(): v.strip() for k, v in row.items() if k is not None and v is not None})

    if not rows:
        print("⚠️  sprint.csv è vuoto!")
        return {}

    print(f"   📋 Totale task in sprint.csv: {len(rows)}")
    print(f"   📋 Colonne trovate: {list(rows[0].keys())}")

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

    num_sprints = max(by_sprint.keys(), default=0)
    ratios = {}

    for i in range(1, num_sprints + 1):
        sprint_rows = by_sprint.get(i, [])
        total_sp    = len(sprint_rows)
        done        = sum(1 for r in sprint_rows if has_author(r, autore_col))
        ratio       = done / total_sp if total_sp > 0 else 0.0
        ratios[i]   = ratio
        print(f"   Sprint {i}: {done}/{total_sp} task completate = {ratio:.1%}")

    return ratios


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


def load_sprint_blocks_from_files(sprint_dir: str) -> list:
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


def update_metrics():
    # 1. Tariffe
    if not os.path.exists(TARIFFA_FILE):
        default_tariffe = {
            "Responsabile": 30, "Amministratore": 20, "Analista": 25,
            "Progettista": 25, "Programmatore": 15, "Verificatore": 15
        }
        with open(TARIFFA_FILE, 'w', encoding='utf-8') as f:
            json.dump(default_tariffe, f, indent=4)

    with open(TARIFFA_FILE, 'r', encoding='utf-8') as f:
        tariffe = json.load(f)

    # 2. Leggi blocchi dai file sprint-N.typ
    if not os.path.isdir(SPRINT_DIR):
        print(f"❌ Cartella sprint non trovata: {SPRINT_DIR}")
        return

    print("\n🔍 Lettura file sprint:")
    blocks = load_sprint_blocks_from_files(SPRINT_DIR)

    if not blocks:
        print("❌ Nessun file sprint-N.typ trovato nella cartella.")
        return

    # 3. Ratio completamento da sprint.csv
    if not os.path.exists(SPRINT_CSV):
        print(f"❌ {SPRINT_CSV} non trovato in {os.path.abspath(SPRINT_CSV)}")
        return

    print("\n🔍 Analisi sprint.csv:")
    ev_ratios = load_completed_ratio_per_sprint(SPRINT_CSV)

    if not ev_ratios:
        print("❌ Nessun ratio calcolato. Controlla sprint.csv e i SPRINT_BOUNDARIES.")
        return

    # 4. Calcolo metriche
    num_sprints_total = max(len(blocks), max(ev_ratios.keys(), default=0), len(SPRINT_BOUNDARIES))

    data_points  = []
    cum_pv, cum_ac, cum_ev = 0, 0, 0
    cum_ore_prev, cum_ore_eff = 0, 0

    print(f"\n📊 Calcolo metriche ({num_sprints_total} sprint totali):")

    for i in range(1, num_sprints_total + 1):
        s_pv, s_ac = 0, 0
        s_ore_prev, s_ore_eff = 0, 0

        block = blocks[i - 1] if i <= len(blocks) else ""

        if not block:
            print(f"  ⚠️  Sprint {i}: nessun blocco oreProduttive → PV=0, AC=0")

        entries = re.findall(r"\(([^()]+)\)", block)
        for entry in entries:
            entry = entry.replace('\n', ' ').strip()
            r_match = re.search(r"ruolo:\s*ruoli\.(\w+)", entry)
            p_match = re.search(r"orePreviste:\s*(\d+)", entry)
            e_match = re.search(r"oreEffettive:\s*(\d+)", entry)

            if r_match and p_match and e_match:
                ruolo = r_match.group(1)
                prev  = int(p_match.group(1))
                eff   = int(e_match.group(1))
                costo = tariffe.get(ruolo, 0)

                s_pv       += prev * costo   # PV = ore previste × tariffa
                s_ac       += eff  * costo   # AC = ore effettive × tariffa (REALE, non derivato da EV)
                s_ore_prev += prev
                s_ore_eff  += eff

        ratio  = ev_ratios.get(i, 0.0)
        s_ev   = s_pv * ratio              # EV = PV sprint × % task completate

        cum_pv       += s_pv
        cum_ac       += s_ac
        cum_ev       += s_ev
        cum_ore_prev += s_ore_prev
        cum_ore_eff  += s_ore_eff

        cpi  = cum_ev / cum_ac if cum_ac > 0 else 1.0
        spi  = cum_ev / cum_pv if cum_pv > 0 else 1.0

        eac  = BAC_FISSO / cpi if cpi > 0 else BAC_FISSO
        etc  = eac - cum_ac
        tcpi_denom = BAC_FISSO - cum_ac
        tcpi = (BAC_FISSO - cum_ev) / tcpi_denom if tcpi_denom > 0 else 1.0
        time_eac        = SETTIMANE_PIANIFICATE / spi if spi > 0 else SETTIMANE_PIANIFICATE
        time_efficiency = cum_ore_prev / cum_ore_eff   if cum_ore_eff > 0 else 1.0

        sv = cum_ev - cum_pv
        cv = cum_ev - cum_ac

        data_points.append({
            'Sprint': f"Sprint {i}", 'PV': round(cum_pv), 'AC': round(cum_ac),
            'EV': round(cum_ev), 'OrePrev': cum_ore_prev, 'OreEff': cum_ore_eff,
            'SPI': round(spi, 3), 'CPI': round(cpi, 3),
            'EAC': round(eac), 'ETC': round(max(0, etc)),
            'TCPI': round(tcpi, 3), 'TimeEAC': round(time_eac, 2),
            'TimeEfficiency': round(time_efficiency, 3),
            'SV': round(sv), 'CV': round(cv),
        })

        print(f"  Sprint {i}: PV={cum_pv:.0f}€  EV={cum_ev:.0f}€  AC={cum_ac:.0f}€"
              f"  SPI={spi:.3f}  CPI={cpi:.3f}  EAC={eac:.0f}€  ({ratio:.1%} task ok)")

    # 5. Export CSV
    csv_map = [
        ('01-planned_value.csv',                 'PV'),
        ('02-earned_value.csv',                  'EV'),
        ('03-actual_cost.csv',                   'AC'),
        ('04-schedule_performance_index.csv',    'SPI'),
        ('05-cost_performance_index.csv',         'CPI'),
        ('06-estimate_at_completion.csv',         'EAC'),
        ('07-to_complete_performance_index.csv',  'TCPI'),
        ('08-estimate_to_complete.csv',           'ETC'),
        ('15-process_lead_time.csv',              'TimeEAC'),
        ('12-task-completion-on-time.csv',        'TimeEfficiency'),
        ('10-schedule_variance.csv',              'SV'),
        ('09-cost_variance.csv',                  'CV'),
    ]

    print()
    for filename, key in csv_map:
        with open(os.path.join(OUTPUT_DIR, filename), 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['Sprint', key])
            for d in data_points:
                writer.writerow([d['Sprint'], d[key]])
        print(f"💾 Aggiornato: {filename}")


if __name__ == "__main__":
    update_metrics()