#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nodo foglia modello")
    #label(deps.slugify("Visualizzazione nodo foglia modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni associate a un nodo foglia nel decision tree del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nodo foglia modello")
  ]

)