#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica nome modello")
    #label(deps.slugify("Modifica nome modello"))
    ],

  descrizione:[
  L'Utente deve poter modificare il nome del modello durante la modifica dell'anagrafica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica nome modello")
  ]
)