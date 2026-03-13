#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice nodo")
    #label(deps.slugify("Visualizzazione codice nodo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo nella visualizzazione del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice nodo")
  ]

)