#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento codice nodo di decisione")
    #label(deps.slugify("Inserimento codice nodo di decisione"))
    ],

  descrizione:[
  L'Utente deve poter inserire il codice del nodo durante l'aggiunta di un nodo di decisione al decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci codice nodo decision tree")
  ]
)