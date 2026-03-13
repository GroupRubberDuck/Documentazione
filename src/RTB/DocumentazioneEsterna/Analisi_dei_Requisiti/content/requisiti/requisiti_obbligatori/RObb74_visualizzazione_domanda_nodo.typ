#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione domanda nodo")
    #label(deps.slugify("Visualizzazione domanda nodo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la domanda associata al nodo nella visualizzazione del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza domanda nodo")
  ]
)