# 🛠️ Guida ai Template di Generazione

Questa cartella contiene i file base usati dallo script Python per generare i documenti Typst.

## Segnaposti Disponibili

Quando modifichi un template, lo script Python sostituirà in automatico questi tag:

| Segnaposto | Dove si usa | Cosa genera | Esempio |
|------------|-------------|-------------|---------|
| `{{TITOLO}}` | Template base | Titolo formattato | `Login utente` |
| `{{LIVELLO}}` | Template base | Livello numerico | `2` |
| `{{FILE_PATH}}` | Index Row | Percorso del file | `01_auth/01.1_login.typ` |
| `{{FILE_NAME_CLEAN}}` | Index Row | Variabile Typst | `01_1_login` |
| `{{INDEX}}` | Index Row | Contatore array | `0`, `1`, `2`... |
| `{{ARRAY_ITEMS}}` | Index Footer| Dump degli items | `item_0, item_1,` |