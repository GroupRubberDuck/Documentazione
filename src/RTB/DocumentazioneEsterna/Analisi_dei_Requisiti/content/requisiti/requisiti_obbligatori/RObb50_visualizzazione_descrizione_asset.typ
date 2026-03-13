#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione descrizione asset")
    #label(deps.slugify("Visualizzazione descrizione asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione dell'asset nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza descrizione asset")
  ]

)