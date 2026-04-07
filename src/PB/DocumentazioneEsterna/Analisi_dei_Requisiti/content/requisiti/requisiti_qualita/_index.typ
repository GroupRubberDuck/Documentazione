#import "config/deps.typ" as deps
#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ" as utils:uc-transformation-con-link
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



#import "RQ-Obb001_metriche_di_qualita.typ": data as item_0, req-name as req-0

#table-cells.push( item_0)


#import "RQ-Obb002_norme_di_progetto.typ": data as item_1, req-name as req-1

#table-cells.push( item_1)


#import "RQ-Obb003_manuale_utente.typ": data as item_2, req-name as req-2

#table-cells.push( item_2)


#import "RQ-Obb004_documentazione_su_repository_github.typ": data as item_3, req-name as req-3

#table-cells.push( item_3)


#import "RQ-Obb005_codice_sorgente_su_repository_github.typ": data as item_4, req-name as req-4

#table-cells.push( item_4)


#import "RQ-Obb006_metodologia_agile.typ": data as item_5, req-name as req-5

#table-cells.push( item_5)



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