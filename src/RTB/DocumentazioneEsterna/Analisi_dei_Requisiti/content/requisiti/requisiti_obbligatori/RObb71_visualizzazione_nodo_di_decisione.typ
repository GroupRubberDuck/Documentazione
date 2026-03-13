#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nodo di decisione")
    #label(deps.slugify("Visualizzazione nodo di decisione"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni di un nodo di decisione all'interno del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nodo di decisione")
  ]
)