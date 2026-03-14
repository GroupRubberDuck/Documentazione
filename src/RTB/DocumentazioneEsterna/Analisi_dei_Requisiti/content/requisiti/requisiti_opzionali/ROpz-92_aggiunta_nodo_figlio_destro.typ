#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta nodo figlio destro")
    #label(deps.slugify("Aggiunta nodo figlio destro"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo figlio destro a un nodo del decision tree durante una sessione di modifica del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi nodo figlio destro")
  ]

)