#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione risposta nodo")
    #label(deps.slugify("Visualizzazione risposta nodo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la risposta associata al nodo nella visualizzazione del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza risposta nodo")
  ]
)