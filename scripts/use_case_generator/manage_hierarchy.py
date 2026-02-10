import os
import yaml # pip install pyyaml
import re
import sys

# --- CONFIGURAZIONE ---
CONFIG_FILE = 'src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/struttura_use_case.yml'
OUTPUT_DIR = 'src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/use_case' 
EXT = '.typ'

# !!! IMPORTANTE: Metti a False SOLO quando sei sicuro di voler applicare le modifiche !!!
DRY_RUN = True  
# ----------------------

def get_flat_structure(items, parent_prefix=""):
    """Legge lo YAML ricorsivamente e crea una lista piatta."""
    flat_list = []
    if items is None: return []

    for i, item in enumerate(items, start=1):
        if parent_prefix == "":
            current_code = f"{i:02d}"
        else:
            current_code = f"{parent_prefix}.{i}"
            
        if isinstance(item, str):
            flat_list.append((current_code, item))
        elif isinstance(item, dict):
            for key, children in item.items():
                flat_list.append((current_code, key))
                flat_list.extend(get_flat_structure(children, current_code))
    return flat_list

def main():
    if not os.path.exists(CONFIG_FILE):
        print(f"❌ Errore: Non trovo il file {CONFIG_FILE}")
        return

    print(f"--- AVVIO SCRIPT (Modalità Simulazione: {DRY_RUN}) ---")
    if DRY_RUN:
        print("ℹ️  Nessun file verrà toccato. Metti DRY_RUN = False nel codice per agire.\n")

    # 1. Leggi configurazione desiderata
    with open(CONFIG_FILE, 'r') as f:
        data = yaml.safe_load(f)
    
    desired_structure = get_flat_structure(data)
    
    # 2. Mappa file esistenti
    # Cerchiamo file tipo "01_nome.typ" o "01.1.2_nome.typ"
    existing_files = {} 
    all_files = os.listdir(OUTPUT_DIR)
    
    for f in all_files:
        if f.endswith(EXT):
            # Regex: cattura (CODICE)_(NOME).typ
            match = re.match(r'([\d\.]+)_(.+)' + re.escape(EXT) + '$', f)
            if match:
                code, name = match.groups()
                existing_files[name] = f

    # 3. Esegui operazioni
    imports_list = []
    
    for code, name in desired_structure:
        target_filename = f"{code}_{name}{EXT}"
        target_path = os.path.join(OUTPUT_DIR, target_filename)
        
        imports_list.append(f'#include "{target_filename}"')

        # CASO A: Il file esiste già (ha lo stesso nome logico)
        if name in existing_files:
            current_filename = existing_files[name]
            current_path = os.path.join(OUTPUT_DIR, current_filename)

            if current_filename == target_filename:
                print(f"✅ [OK] {current_filename} è già corretto.")
            else:
                # Dobbiamo rinominare
                if os.path.exists(target_path):
                    print(f"⚠️  [STOP] Impossibile rinominare '{current_filename}' in '{target_filename}': Il file di destinazione ESISTE GIÀ!")
                    print("    Risolvi manualmente il conflitto o sposta il file che blocca.")
                else:
                    if DRY_RUN:
                        print(f"🔄 [SIMULAZIONE] Rinomino: {current_filename} -> {target_filename}")
                    else:
                        print(f"🔄 Rinomino: {current_filename} -> {target_filename}")
                        os.rename(current_path, target_path)

        # CASO B: Il file non esiste proprio
        else:
            if os.path.exists(target_path):
                 # Caso raro: esiste un file col nome target ma non l'abbiamo mappato noi? Meglio non toccare.
                 print(f"⚠️  [STOP] Volevo creare '{target_filename}' ma esiste già un file sconosciuto con questo nome.")
            else:
                if DRY_RUN:
                    print(f"✨ [SIMULAZIONE] Creo nuovo file: {target_filename}")
                else:
                    print(f"✨ Creo nuovo file: {target_filename}")
                    with open(target_path, 'w') as f:
                        pretty_title = name.replace('_', ' ').capitalize()
                        level = code.count('.') + 1
                        heading = "=" * (level if level <= 3 else 3)
                        f.write(f"{heading} {pretty_title}\n\n// Contenuto per {name}\n")

    # Generazione Indice (Opzionale)
    if not DRY_RUN:
        with open('_index.typ', 'w') as f:
            f.write("// FILE GENERATO AUTOMATICAMENTE\n")
            f.write("\n".join(imports_list))
        print("\n📝 Aggiornato _index.typ")

if __name__ == "__main__":
    main()