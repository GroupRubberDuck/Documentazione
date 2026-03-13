#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice requisito modello")
    #label(deps.slugify("Visualizzazione codice requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito nell'anagrafica del requisito del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice requisito modello")
  ]
)