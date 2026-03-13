#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome del requisito modello")
    #label(deps.slugify("Visualizzazione nome del requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del requisito nell'anagrafica del requisito del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome del requisito modello")
  ]

)