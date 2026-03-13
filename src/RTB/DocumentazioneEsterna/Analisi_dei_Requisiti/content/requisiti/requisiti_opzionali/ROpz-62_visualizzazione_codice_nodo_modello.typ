#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice nodo modello")
    #label(deps.slugify("Visualizzazione codice nodo modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo decisionale nel decision tree del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice nodo modello")
  ]
)