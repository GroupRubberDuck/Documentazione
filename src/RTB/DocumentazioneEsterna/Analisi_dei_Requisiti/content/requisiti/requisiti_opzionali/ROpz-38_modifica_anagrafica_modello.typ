#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica anagrafica modello")
    #label(deps.slugify("Modifica anagrafica modello"))
    ],

  descrizione:[
  L'Utente deve poter modificare l'anagrafica di un modello esistente.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica anagrafica modello")
  ]
)