#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio codice nodo modello")
    #label(deps.slugify("Visualizzazione dettaglio codice nodo modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo nel dettaglio del nodo decisionale del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio codice nodo modello")
  ]
)