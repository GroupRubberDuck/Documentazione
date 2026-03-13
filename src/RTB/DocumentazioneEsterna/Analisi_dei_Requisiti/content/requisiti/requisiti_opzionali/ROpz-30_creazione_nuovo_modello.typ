#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Creazione nuovo modello")
    #label(deps.slugify("Creazione nuovo modello"))
    ],

  descrizione:[
  L'Utente deve poter creare manualmente un nuovo modello vuoto.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Crea nuovo modello")
  ]
)