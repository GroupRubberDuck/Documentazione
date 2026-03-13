#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione anagrafica requisito modello")
    #label(deps.slugify("Visualizzazione anagrafica requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare l'anagrafica del requisito nel dettaglio del requisito del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza anagrafica requisito modello")
  ]

)