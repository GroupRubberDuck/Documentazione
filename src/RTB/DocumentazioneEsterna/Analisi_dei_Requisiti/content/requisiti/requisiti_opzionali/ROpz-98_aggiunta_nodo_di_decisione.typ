#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta nodo di decisione")
    #label(deps.slugify("Aggiunta nodo di decisione"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo di decisione al decision tree durante una sessione di modifica del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi nodo di decisione")
  ]
)