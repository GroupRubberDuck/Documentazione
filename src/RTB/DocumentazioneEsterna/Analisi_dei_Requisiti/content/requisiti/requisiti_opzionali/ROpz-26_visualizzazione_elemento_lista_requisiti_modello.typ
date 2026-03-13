#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione elemento lista requisiti modello")
    #label(deps.slugify("Visualizzazione elemento lista requisiti modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni singolo elemento nella lista dei requisiti del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza singolo elemento lista requisiti modello")
  ]

)