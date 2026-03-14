#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta nodo foglia not applicable")
    #label(deps.slugify("Aggiunta nodo foglia not applicable"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo foglia con valore NOT APPLICABLE al decision tree durante una sessione di modifica del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi nodo NA")
  ]
)