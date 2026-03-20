#import "config/deps.typ" as deps
#let req-name="Visualizzazione nodo decision tree"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni associate a ogni nodo del decision tree.
  ],
  fonti:(
    "Visualizza nodo decision tree",
  )
)