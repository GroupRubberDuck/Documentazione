import os
import yaml
import re
import argparse
import shutil # Serve per copiare il template


class Colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    CYAN = '\033[96m'
    RED = '\033[91m'
    RESET = '\033[0m'
# come usare
# simulazione
# python3 scripts/use_case_generator/manager.py scripts/use_case_generator/config.yaml
# creazione e renaming
# python3 scripts/use_case_generator/manager.py scripts/use_case_generator/config.yaml --force

def get_safe_variable_name(filepath):
    """
    Estrae il nome del file dal percorso e lo pulisce per renderlo 
    un nome di variabile Typst valido (senza estensioni, punti o trattini).
    Es: 'cartella/01.1-login.typ' -> '01_1_login'
    """
    # 1. Isola il nome del file
    base_name = os.path.basename(filepath)
    
    # 2. Rimuove l'estensione
    name_no_ext = os.path.splitext(base_name)[0]
    
    # 3. Pulisce i caratteri non ammessi nelle variabili
    safe_name = name_no_ext.replace('.', '_').replace('-', '_')
    
    return safe_name

# --- FUNZIONI DI UTILITÀ ---
def create_file_from_template(target_path, title, level, settings):
    """
    Legge il template, sostituisce i segnaposto e scrive il nuovo file.
    """
    template_path = settings.get('template_path')
    
    # Contenuto di default se manca il template
    content = f"== {title}\n\n// TODO: Compilare Use Case\n"
    
    if template_path and os.path.exists(template_path):
        with open(template_path, 'r', encoding='utf-8') as t:
            template_content = t.read()
            
        # --- LA LOGICA DI RIMPIAZZO ---
        # 1. Sostituisce {{TITOLO}}
        content = template_content.replace("{{TITOLO}}", title)
        
        # 2. Sostituisce {{LIVELLO}} (convertendo l'int in stringa)
        content = content.replace("{{LIVELLO}}", str(level))
        
    else:
        print(f"{Colors.YELLOW}⚠️  Template non trovato in '{template_path}', uso contenuto base.")

    # Scrittura del file finale
    with open(target_path, 'w', encoding='utf-8') as f:
        f.write(content)

def load_config(path):
    """Carica il file YAML e imposta i valori di default se mancano."""
    if not os.path.exists(path):
        print(f"{Colors.RED}❌ Errore: Config file '{path}' non trovato.{Colors.RESET}")
        return None
    
    with open(path, 'r') as f:
        config = yaml.safe_load(f)
    
    # Default settings per evitare crash se mancano chiavi
    defaults = {
        'prefix':"",
        'output_dir': '.',
        'extension': '.typ',
        'index_file': '_index.typ',
        'formatting': {
            'padding': 2,
            'separator': '.',
            'title_separator': '_',
            'filename_style': 'snake_case'
        },
        'template_path': None
    }
    
    # Merge dei dizionari (config sovrascrive defaults)
    settings = defaults.copy()
    if 'settings' in config:
        settings.update(config['settings'])
        # Merge specifico per il dizionario annidato 'formatting'
        if 'formatting' in config['settings']:
            settings['formatting'] = {**defaults['formatting'], **config['settings']['formatting']}
            
    return {'settings': settings, 'structure': config.get('structure', [])}

def format_filename(code_parts, title, settings):
    """
    Costruisce il nome del file basandosi sulle regole di formattazione.
    Input: code_parts=[1, 2], title="Titolo", settings
    Output: "01.2_titolo.typ"
    """
    fmt = settings['formatting']
    prefix = settings['prefix']
    
    # 1. Padding sul primo numero (es. 1 -> "01")
    first_num = str(code_parts[0]).zfill(fmt['padding'])
    
    # 2. Unione dei numeri con il separatore (es. "01" + "." + "2")
    rest_nums = [str(n) for n in code_parts[1:]]
    code_str = fmt['separator'].join([first_num] + rest_nums)
    
    # 3. Formattazione del titolo (snake_case o kebab_case)
    clean_title = title.lower().replace(' ', '_') # Base cleaning
    if fmt['filename_style'] == 'kebab_case':
        clean_title = clean_title.replace('_', '-')
    else:
        clean_title = clean_title.replace('-', '_')
        
    # 4. Assemblaggio finale
    filename = f"{prefix}{code_str}{fmt['title_separator']}{clean_title}{settings['extension']}"
    return filename

def flatten_structure(items, parent_code=[]):
    """
    Trasforma l'albero YAML in una lista piatta di oggetti.
    Restituisce: [ {'code_parts': [1], 'name': 'Intro'}, {'code_parts': [1,1], 'name': 'Sub'} ... ]
    """
    flat_list = []
    if items is None: return []

    for i, item in enumerate(items, start=1):
        current_code = parent_code + [i]
        
        if isinstance(item, str):
            flat_list.append({'code_parts': current_code, 'name': item})
        elif isinstance(item, dict):
            for key, children in item.items():
                flat_list.append({'code_parts': current_code, 'name': key})
                flat_list.extend(flatten_structure(children, current_code))
    return flat_list

def generate_index_file(file_list, settings, dry_run):
    """Crea il file master _index.typ aggregando i file tramite template esterni."""
    index_name = settings.get('index_file', '_index.typ')
    if not index_name: return

    out_dir = settings.get('output_dir', '.')
    path = os.path.join(out_dir, index_name)

    # 1. DEFAULT (Comportamento storico di base)
    header = "// FILE GENERATO AUTOMATICAMENTE - NON MODIFICARE\n\n"
    row_template = '#include "{{FILE_PATH}}"\n'
    footer = ""

    # 2. CARICAMENTO TEMPLATE ESTERNI (Override)
    h_path = settings.get('index_header_template')
    r_path = settings.get('index_row_template')
    f_path = settings.get('index_footer_template')

    if h_path and os.path.exists(h_path):
        with open(h_path, 'r', encoding='utf-8') as f: header = f.read()
    if r_path and os.path.exists(r_path):
        with open(r_path, 'r', encoding='utf-8') as f: row_template = f.read()
    if f_path and os.path.exists(f_path):
        with open(f_path, 'r', encoding='utf-8') as f: footer = f.read()

    # 3. ASSEMBLAGGIO
    content = header
    array_items_str = ""

    for i, filename in enumerate(file_list):
        # Es: da "01_auth/01.1_login.typ" a "01_1_login"
        clean_name = get_safe_variable_name(filename)        
        # Sostituzioni sulla singola riga
        row = row_template.replace("{{FILE_PATH}}", filename)
        row = row.replace("{{FILE_NAME_CLEAN}}", clean_name)
        row = row.replace("{{INDEX}}", str(i))
        
        content += row + "\n" # Aggiungiamo un a capo per sicurezza
        
        array_items_str += f"  item_{i},\n"

    # Sostituzioni sul footer
    footer = footer.replace("{{ARRAY_ITEMS}}", array_items_str)
    content += footer

    # 4. SCRITTURA
    if dry_run:
        print(f"{Colors.CYAN}📝 [SIM] Aggiornerei l'indice '{index_name}' usando template esterni.{Colors.RESET}")
    else:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"{Colors.CYAN}📝 Indice '{index_name}' generato con successo.{Colors.RESET}")

def sync_files(config, dry_run):
    settings = config['settings']
    structure = config['structure']
    out_dir = settings['output_dir']
    
    # 1. Prepara la lista desiderata
    desired_items = flatten_structure(structure)
    final_file_list = [] # Terrà traccia dei nomi file finali per l'indice
    
    # Creazione cartella output se non esiste
    if not os.path.exists(out_dir) and not dry_run:
        os.makedirs(out_dir)

    # 2. Mappa i file esistenti (ignorando il prefisso numerico per trovare i match)
    # Cerchiamo file che finiscono con _nome.typ (o -nome.typ)
    existing_files = {} # { "autenticazione": "01_autenticazione.typ" }
    
    if os.path.exists(out_dir):
        for f in os.listdir(out_dir):
            if f.endswith(settings['extension']) and f != settings['index_file']:
                # Regex flessibile: Numeri + Separatore + Nome + Ext
                # Cattura tutto ciò che è dopo il primo separatore titolo (es _)
                parts = f.split(settings['formatting']['title_separator'], 1)
                if len(parts) == 2:
                    # parts[0] è il codice (es 01.1), parts[1] è nome+ext (autenticazione.typ)
                    name_part = parts[1].replace(settings['extension'], '')
                    # Normalizziamo il nome part (se passiamo da snake a kebab)
                    # Per semplicità, usiamo il nome raw trovato nel file system come chiave se combacia
                    existing_files[name_part] = f
                    # Nota: una logica di matching più robusta richiederebbe pulizia stringhe, 
                    # ma per ora assumiamo che l'utente non cambi stile (snake/kebab) ogni giorno.

    # 3. Iterazione e Sincronizzazione
    print(f"{Colors.GREEN}--- Sincronizzazione in corso (Dry Run: {dry_run}) ---")
    
    for item in desired_items:
        # Calcola il nome file IDEALE
        target_filename = format_filename(item['code_parts'], item['name'], settings)
        target_path = os.path.join(out_dir, target_filename)
        final_file_list.append(target_filename)
        
        # Pulizia nome per matching (rimuove stile snake/kebab per confronto logico)
        # Questo è un punto delicato: cerchiamo di matchare il nome nello YAML con quello su disco
        name_key_snake = item['name'].lower().replace(' ', '_').replace('-', '_')
        name_key_kebab = item['name'].lower().replace(' ', '-').replace('_', '-')
        
        current_filename = None
        if name_key_snake in existing_files: current_filename = existing_files[name_key_snake]
        elif name_key_kebab in existing_files: current_filename = existing_files[name_key_kebab]

        # LOGICA AZIONI
        if current_filename:
            # Il file esiste. Ha il nome corretto (numero giusto)?
            if current_filename != target_filename:
                # RINOMINA
                src = os.path.join(out_dir, current_filename)
                if os.path.exists(target_path):
                     print(f"{Colors.YELLOW}⚠️ [SKIP] {target_filename} esiste già (conflitto).")
                else:
                    action = "🔄 [SIM] Rinomino" if dry_run else "🔄 Rinomino"
                    print(f"{Colors.CYAN}{action}: {current_filename} -> {target_filename}")
                    if not dry_run: os.rename(src, target_path)
            else:
                # FILE OK
                # print(f"✅ {current_filename} ok") # Decommenta per verbose
                pass
        else:
            # NUOVO FILE
            action = "✨ [SIM] Creo" if dry_run else "✨ Creo"
            print(f"{Colors.CYAN}{action}: {target_filename}")
            
            if not dry_run:
                # Calcoliamo titolo "bello" e livello
                pretty_title = item['name'].replace('_', ' ').replace('-', ' ').capitalize() # O .title()

                # Il livello è la lunghezza dell'array code_parts (es. [1, 2] -> livello 2)
                level = len(item['code_parts'])

                create_file_from_template(target_path, pretty_title, level, settings)

    # 4. Generazione Indice
    generate_index_file(final_file_list, settings, dry_run)

# --- ENTRY POINT ---

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('config', help="Percorso del file config.yaml")
    parser.add_argument('--force', action='store_true', help="Applica modifiche reali")
    args = parser.parse_args()

    config_data = load_config(args.config)
    if config_data:
        sync_files(config_data, dry_run=not args.force)