#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nodo decisione modello")
    #label(deps.slugify("Visualizzazione nodo decisione modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni di un nodo decisionale nel decision tree del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nodo decisione modello")
  ]
)