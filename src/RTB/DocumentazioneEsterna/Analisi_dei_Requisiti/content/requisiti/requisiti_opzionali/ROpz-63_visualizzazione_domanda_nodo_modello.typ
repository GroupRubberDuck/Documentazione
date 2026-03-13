#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione domanda nodo modello")
    #label(deps.slugify("Visualizzazione domanda nodo modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la domanda associata al nodo decisionale nel decision tree del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza domanda nodo modello")
  ]
)