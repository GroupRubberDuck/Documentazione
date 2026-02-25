import re, json, csv, os

# CONFIGURAZIONE PERCORSI E COSTI
FILE_SPRINT = "../../../Piano_di_Progetto/content/04-pianificazione_breve_periodo/01-RTB.typ"
TARIFFA_FILE = "costi_ruoli.json" 
OUTPUT_DIR = "." 
BAC_FISSO = 11610  # Budget totale preventivato
SETTIMANE_PIANIFICATE = 8  # Esempio: 4 sprint da 2 settimane

def update_metrics():
    # 1. Caricamento tariffe
    if not os.path.exists(TARIFFA_FILE):
        default_tariffe = {
            "Responsabile": 30, "Amministratore": 20, "Analista": 25,
            "Progettista": 25, "Programmatore": 15, "Verificatore": 15
        }
        with open(TARIFFA_FILE, 'w', encoding='utf-8') as f:
            json.dump(default_tariffe, f, indent=4)
    
    with open(TARIFFA_FILE, 'r', encoding='utf-8') as f:
        tariffe = json.load(f)

    # 2. Lettura Piano di Progetto
    if not os.path.exists(FILE_SPRINT):
        print(f"❌ Errore: File non trovato in {FILE_SPRINT}")
        return

    with open(FILE_SPRINT, 'r', encoding='utf-8') as f:
        content = f.read()

    # 3. Estrazione blocchi oreProduttive
    blocks = re.findall(r"oreProduttive\s*=\s*\((.*?)\)\n", content, re.DOTALL)
    
    data_points = []
    cum_pv, cum_ac, cum_ev = 0, 0, 0
    cum_ore_prev, cum_ore_eff = 0, 0

    for i, block in enumerate(blocks, 1):
        s_pv, s_ac, s_ev = 0, 0, 0
        s_ore_prev, s_ore_eff = 0, 0
        
        entries = re.findall(r"\((.*?)\)", block)
        for entry in entries:
            entry = entry.replace('\n', ' ').strip()
            r_match = re.search(r"ruolo:\s*ruoli\.(\w+)", entry)
            p_match = re.search(r"orePreviste:\s*(\d+)", entry)
            e_match = re.search(r"oreEffettive:\s*(\d+)", entry)
            
            if r_match and p_match and e_match:
                ruolo = r_match.group(1)
                prev = int(p_match.group(1))
                eff = int(e_match.group(1))
                costo = tariffe.get(ruolo, 0)
                
                s_pv += prev * costo
                s_ac += eff * costo
                s_ev += min(prev, eff) * costo
                
                s_ore_prev += prev
                s_ore_eff += eff

        cum_pv += s_pv
        cum_ac += s_ac
        cum_ev += s_ev
        cum_ore_prev += s_ore_prev
        cum_ore_eff += s_ore_eff
        
        # --- CALCOLO METRICHE ---
        cpi = cum_ev / cum_ac if cum_ac > 0 else 1.0
        spi = cum_ev / cum_pv if cum_pv > 0 else 1.0
        
        # EAC e ETC (Economici)
        eac = BAC_FISSO / cpi if cpi > 0 else BAC_FISSO
        etc = eac - cum_ac

        # TCPI (To Complete Performance Index)
        tcpi = (BAC_FISSO - cum_ev) / (BAC_FISSO - cum_ac) if (BAC_FISSO - cum_ac) > 0 else 1.0

        # Temporali
        time_eac = SETTIMANE_PIANIFICATE / spi if spi > 0 else SETTIMANE_PIANIFICATE
        time_efficiency = cum_ore_prev / cum_ore_eff if cum_ore_eff > 0 else 1.0

        data_points.append({
            'Sprint': f"Sprint {i}", 
            'PV': cum_pv, 
            'AC': cum_ac, 
            'EV': cum_ev,
            'OrePrev': cum_ore_prev,
            'OreEff': cum_ore_eff,
            'SPI': round(spi, 3),
            'CPI': round(cpi, 3),
            'EAC': round(eac, 2),
            'ETC': round(max(0, etc), 2),
            'TCPI': round(tcpi, 3),
            'TimeEAC': round(time_eac, 2),
            'TimeEfficiency': round(time_efficiency, 3)
        })

    # 4. Esportazione CSV per ogni metrica
    csv_map = [
        ('01-planned_value.csv', 'PV'), 
        ('02-earned_value.csv', 'EV'),
        ('03-actual_cost.csv', 'AC'),
        ('04-schedule_performance_index.csv', 'SPI'),
        ('05-cost_performance_index.csv', 'CPI'),
        ('06-estimate_at_completion.csv', 'EAC'),
        ('07-to_complete_performance_index.csv', 'TCPI'),
        ('08-estimate_to_complete.csv', 'ETC'),
        ('15-process_lead_time.csv', 'TimeEAC'),
        ('16-task_completion_on_time.csv', 'TimeEfficiency')
    ]

    for filename, key in csv_map:
        with open(os.path.join(OUTPUT_DIR, filename), 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['Sprint', key])
            for d in data_points:
                writer.writerow([d['Sprint'], d[key]])
        print(f"💾 Aggiornato: {filename}")

if __name__ == "__main__":
    update_metrics()