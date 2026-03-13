#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione modello")
    #label(deps.slugify("Eliminazione modello"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un modello esistente dal sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina modello")
  ]
)