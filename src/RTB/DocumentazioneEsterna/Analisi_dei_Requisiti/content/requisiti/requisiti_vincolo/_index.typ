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



#import "RV-opz001_applicazione_web_locale.typ": data as item_0, req-name as req-0

#table-cells.push( item_0)


#import "RV-opz002_backend_in_python.typ": data as item_1, req-name as req-1

#table-cells.push( item_1)


#import "RV-opz003_supporto_containerizzazione_docker.typ": data as item_2, req-name as req-2

#table-cells.push( item_2)


#import "RV-opz004_database_relazionale.typ": data as item_3, req-name as req-3

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