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
#let req-uc-dict=(:)


#import "RDes001_eliminazione_dispositivo_con_backup.typ": data as item_0, req-name as req-0

#req-uc-dict.insert(
  req-0
  ,
  item_0.fonti
  )


#{
item_0.fonti=utils.format-array(item_0.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_0)



#import "RDes002_eliminazione_dispositivo_con_backup_json.typ": data as item_1, req-name as req-1

#req-uc-dict.insert(
  req-1
  ,
  item_1.fonti
  )


#{
item_1.fonti=utils.format-array(item_1.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_1)



#import "RDes003_eliminazione_dispositivo_con_backup_xml.typ": data as item_2, req-name as req-2

#req-uc-dict.insert(
  req-2
  ,
  item_2.fonti
  )


#{
item_2.fonti=utils.format-array(item_2.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_2)



#import "RDes004_eliminazione_dispositivo_con_backup_csv.typ": data as item_3, req-name as req-3

#req-uc-dict.insert(
  req-3
  ,
  item_3.fonti
  )


#{
item_3.fonti=utils.format-array(item_3.fonti,transf:uc-transformation-con-link)

}

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