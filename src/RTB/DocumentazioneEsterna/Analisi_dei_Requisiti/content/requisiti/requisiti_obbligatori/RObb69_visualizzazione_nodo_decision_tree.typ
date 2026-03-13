#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nodo decision tree")
    #label(deps.slugify("Visualizzazione nodo decision tree"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni associate a ogni nodo del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nodo decision tree")
  ]
)