import re, json, csv, os

# CONFIGURAZIONE PERCORSI
# Risaliamo di 3 livelli per trovare il Piano di Progetto
FILE_SPRINT = "../../../Piano_di_Progetto/content/04-pianificazione_breve_periodo/01-RTB.typ"

# Usiamo la cartella corrente (dove si trova lo script)
TARIFFA_FILE = "costi_ruoli.json" 
OUTPUT_DIR = "." 

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
    cum_pv, cum_ac = 0, 0

    for i, block in enumerate(blocks, 1):
        print(f"\n--- Analisi Sprint {i} ---")
        s_pv, s_ac = 0, 0
        
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
                print(f"  OK -> Ruolo: {ruolo:15} | Prev: {prev}h ({prev*costo}€) | Eff: {eff}h ({eff*costo}€)")

        cum_pv += s_pv
        cum_ac += s_ac
        
        print(f"  TOTALE SPRINT {i}: PV = {s_pv}€ | AC = {s_ac}€")
        data_points.append({'s': f"Sprint {i}", 'PV': cum_pv, 'AC': cum_ac})

    # 4. Scrittura CSV (Aggiorna i file nella stessa cartella)
    for name, key in [('01-planned_value.csv', 'PV'), ('03-actual_cost.csv', 'AC')]:
        # Salvataggio diretto senza creare sottocartelle
        with open(name, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['Sprint', key])
            for d in data_points:
                writer.writerow([d['s'], d[key]])
        print(f"💾 Aggiornato: {name}")
    
    print(f"\n✅ Aggiornamento completato nella cartella corrente.")

if __name__ == "__main__":
    update_metrics()