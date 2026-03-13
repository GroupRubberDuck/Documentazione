#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio domanda nodo modello")
    #label(deps.slugify("Visualizzazione dettaglio domanda nodo modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la domanda associata al nodo nel dettaglio del nodo decisionale del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio domanda nodo modello")
  ]

)