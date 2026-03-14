#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica domanda nodo decision tree")
    #label(deps.slugify("Modifica domanda nodo decision tree"))
    ],

  descrizione:[
  L'Utente deve poter modificare la domanda associata a un nodo di decisione esistente nel decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica domanda nodo decision tree")
  ]
)