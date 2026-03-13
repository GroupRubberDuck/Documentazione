#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Navigazione nodo precedente")
    #label(deps.slugify("Navigazione nodo precedente"))
    ],

  descrizione:[
  L'Utente deve poter tornare al nodo precedente del decision tree per modificare una risposta già inserita.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Vai al nodo precedente")
  ]
)