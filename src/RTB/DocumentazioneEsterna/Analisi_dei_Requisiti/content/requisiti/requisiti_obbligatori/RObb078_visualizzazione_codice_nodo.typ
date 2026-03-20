#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice nodo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo nella visualizzazione del decision tree.
  ],
  fonti:(
    "Visualizza codice nodo",
  )

)