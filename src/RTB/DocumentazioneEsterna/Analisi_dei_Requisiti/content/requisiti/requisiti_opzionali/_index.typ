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
#import "ROpz-01_requisitoa.typ": data as item_0

#table-cells.push( item_0)

#import "ROpz-02_b.typ": data as item_1

#table-cells.push( item_1)

#import "ROpz-03_c.typ": data as item_2

#table-cells.push( item_2)

#import "ROpz-04_d.typ": data as item_3

#table-cells.push( item_3)

#import "ROpz-05_q.typ": data as item_4

#table-cells.push( item_4)

#import "ROpz-06_w.typ": data as item_5

#table-cells.push( item_5)

#import "ROpz-07_e.typ": data as item_6

#table-cells.push( item_6)

#import "ROpz-08_r.typ": data as item_7

#table-cells.push( item_7)

#import "ROpz-09_t.typ": data as item_8

#table-cells.push( item_8)



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