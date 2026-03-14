#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta nodo")
    #label(deps.slugify("Aggiunta nodo"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nuovo nodo al decision tree durante una sessione di modifica del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi nodo")
  ]
)