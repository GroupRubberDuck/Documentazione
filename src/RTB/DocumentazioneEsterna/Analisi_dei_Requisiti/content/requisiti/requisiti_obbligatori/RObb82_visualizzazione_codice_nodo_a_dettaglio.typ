#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice nodo a dettaglio")
    #label(deps.slugify("Visualizzazione codice nodo a dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo nel dettaglio del nodo decisionale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice nodo a dettaglio")
  ]

)