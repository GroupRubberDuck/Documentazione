#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento domanda nodo di decisione")
    #label(deps.slugify("Inserimento domanda nodo di decisione"))
    ],

  descrizione:[
  L'Utente deve poter inserire la domanda associata al nodo durante l'aggiunta di un nodo di decisione al decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci domanda nodo decision tree")
  ]
)