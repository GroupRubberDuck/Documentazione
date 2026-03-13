#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione risposta nodo a dettaglio")
    #label(deps.slugify("Visualizzazione risposta nodo a dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la risposta associata al nodo nel dettaglio del nodo decisionale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza risposta nodo a dettaglio")
  ]
)