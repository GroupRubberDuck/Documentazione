#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista requisiti asset")
    #label(deps.slugify("Visualizzazione lista requisiti asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti applicabili all'asset nel contesto della sessione di valutazione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista requisiti asset")
  ]

)