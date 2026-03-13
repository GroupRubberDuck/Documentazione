#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Nessuna risposta associata a nodo")
    #label(deps.slugify("Nessuna risposta associata a nodo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un'indicazione visiva che un nodo non ha ancora una risposta associata nella visualizzazione del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Nessuna risposta associata")
  ]
)