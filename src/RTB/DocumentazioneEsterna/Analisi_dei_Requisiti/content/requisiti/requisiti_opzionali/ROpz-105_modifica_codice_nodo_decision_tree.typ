#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica codice nodo decision tree")
    #label(deps.slugify("Modifica codice nodo decision tree"))
    ],

  descrizione:[
  L'Utente deve poter modificare il codice di un nodo di decisione esistente nel decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica codice nodo decision tree")
  ]
)