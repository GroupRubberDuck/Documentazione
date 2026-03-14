#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo con backup csv")
    #label(deps.slugify("Eliminazione dispositivo con backup csv"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo scaricando un file di backup in formato CSV.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina dispositivo con back up CSV")
  ]
 
)