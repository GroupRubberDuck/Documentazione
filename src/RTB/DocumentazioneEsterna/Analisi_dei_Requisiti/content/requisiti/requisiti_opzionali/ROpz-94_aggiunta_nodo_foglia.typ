#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta nodo foglia")
    #label(deps.slugify("Aggiunta nodo foglia"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo foglia al decision tree durante una sessione di modifica del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi nodo foglia")
  ]

)