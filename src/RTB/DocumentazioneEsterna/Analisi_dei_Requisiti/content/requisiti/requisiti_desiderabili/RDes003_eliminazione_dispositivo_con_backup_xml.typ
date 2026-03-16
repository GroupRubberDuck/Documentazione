#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo con backup xml")
    #label(deps.slugify("Eliminazione dispositivo con backup xml"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo scaricando un file di backup in formato XML.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina dispositivo con back up XML")
  ]
)