#import "config/deps.typ"
// ============================================================================
// ⚠️ ATTENZIONE: FILE GENERATO AUTOMATICAMENTE ⚠️
// ============================================================================
// Questo file è stato creato dallo script di automazione (manager.py).
// NON MODIFICARE MANUALMENTE QUESTO FILE!
// 
// Qualsiasi modifica apportata qui verrà inesorabilmente cancellata 
// alla prossima esecuzione dello script.
//
// 🛠️ COME FARE MODIFICHE:
// - Per aggiungere, rimuovere o riordinare i file: modifica il file 'config.yml'.
// - Per modificare il contenuto di una singola voce: apri il file .typ corrispondente.
// - Per cambiare questa intestazione: modifica 'config/index_header.typ'.
//
// ============================================================================


#let table-cells=()
#import "RDes01_eliminazione_dispositivo_con_backup.typ": data as item_0

#table-cells.push( item_0)

#import "RDes02_eliminazione_dispositivo_con_backup_json.typ": data as item_1

#table-cells.push( item_1)

#import "RDes03_eliminazione_dispositivo_con_backup_xml.typ": data as item_2

#table-cells.push( item_2)

#import "RDes04_eliminazione_dispositivo_con_backup_csv.typ": data as item_3

#table-cells.push( item_3)



// ============================================================================
// 📦 ESPORTAZIONE DATI (API DEL MODULO)
// ============================================================================
// L'array 'all_data' contiene tutti i dizionari esportati dai singoli file.
// 
// Esempio di utilizzo nel tuo main.typ:
// #import "percorso/a/_index.typ": all_data
// 
#deps.tabella-requisiti(
  ..(table-cells.map(it=>{
  it.values()
}).flatten()))

// --- Fine del file generato ---