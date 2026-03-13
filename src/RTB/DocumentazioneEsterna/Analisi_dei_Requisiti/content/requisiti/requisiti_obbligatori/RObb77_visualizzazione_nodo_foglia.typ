#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nodo foglia")
    #label(deps.slugify("Visualizzazione nodo foglia"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni di un nodo foglia all'interno del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nodo foglia")
  ]
)