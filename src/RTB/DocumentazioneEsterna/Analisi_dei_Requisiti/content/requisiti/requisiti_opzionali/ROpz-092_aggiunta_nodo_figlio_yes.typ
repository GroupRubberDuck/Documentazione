#import "config/deps.typ" as deps
#let req-name="Aggiunta nodo figlio YES"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo figlio con una relazione di bivio logico YES a un nodo dello scheletro del decision tree durante una sessione di modifica del modello.

  ],
  fonti:(
    "Aggiungi nodo figlio YES",
  )
)