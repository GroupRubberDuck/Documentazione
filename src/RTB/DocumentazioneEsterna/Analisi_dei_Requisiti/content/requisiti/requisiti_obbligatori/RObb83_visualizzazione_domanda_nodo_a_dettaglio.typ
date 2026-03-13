#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione domanda nodo a dettaglio")
    #label(deps.slugify("Visualizzazione domanda nodo a dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la domanda associata al nodo nel dettaglio del nodo decisionale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza domanda nodo a dettaglio")
  ]

)