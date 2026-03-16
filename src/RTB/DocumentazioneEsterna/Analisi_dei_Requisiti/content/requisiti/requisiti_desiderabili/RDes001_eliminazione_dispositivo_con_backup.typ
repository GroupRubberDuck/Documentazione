#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo con backup")
    #label(deps.slugify("Eliminazione dispositivo con backup"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo scaricando un file di backup con i relativi dati.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina dispositivo con back up")
  ]
 
)