#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Valutazione nodo di decisione")
    #label(deps.slugify("Valutazione nodo di decisione"))
    ],

  descrizione:[
  L'Utente deve poter inserire una risposta per il nodo di decisione corrente durante la compilazione del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Valuta nodo di decisione")
  ]
)