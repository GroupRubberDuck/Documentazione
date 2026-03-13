#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Navigazione nodo successivo")
    #label(deps.slugify("Navigazione nodo successivo"))
    ],

  descrizione:[
  L'Utente deve poter navigare al nodo successivo del decision tree dopo aver selezionato una risposta.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Vai al nodo successivo")
  ]
)