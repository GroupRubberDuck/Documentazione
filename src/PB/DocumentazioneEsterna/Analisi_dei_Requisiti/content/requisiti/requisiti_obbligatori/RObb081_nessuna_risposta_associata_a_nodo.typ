#import "config/deps.typ" as deps
#let req-name="Nessuna risposta associata a nodo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un'indicazione visiva che un nodo non ha ancora una risposta associata nella visualizzazione del decision tree.
  ],
  fonti:(
    "Nessuna risposta associata",
    )
)