#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica nodo di decisione")
    #label(deps.slugify("Modifica nodo di decisione"))
    ],

  descrizione:[
  L'Utente deve poter modificare le informazioni di un nodo di decisione esistente nel decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica nodo")
  ]
)