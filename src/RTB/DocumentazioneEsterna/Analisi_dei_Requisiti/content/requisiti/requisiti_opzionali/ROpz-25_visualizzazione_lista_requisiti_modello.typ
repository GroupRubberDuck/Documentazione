#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista requisiti modello")
    #label(deps.slugify("Visualizzazione lista requisiti modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti associati a un modello nel dettaglio del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista requisiti modello")
  ]
)