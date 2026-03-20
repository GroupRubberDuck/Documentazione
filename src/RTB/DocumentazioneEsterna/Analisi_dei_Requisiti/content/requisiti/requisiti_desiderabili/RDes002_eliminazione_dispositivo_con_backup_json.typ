#import "config/deps.typ" as deps
#let req-name="Eliminazione dispositivo con backup json"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo scaricando un file di backup in formato JSON.
  ],
  fonti:("Elimina dispositivo con back up JSON",
  )
)