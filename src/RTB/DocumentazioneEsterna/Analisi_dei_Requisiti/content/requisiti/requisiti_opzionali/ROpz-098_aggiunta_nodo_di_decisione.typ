#import "config/deps.typ" as deps
#let req-name="Aggiunta nodo di decisione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo di decisione al decision tree durante una sessione di modifica del modello.

  ],
  fonti:(
    "Aggiungi nodo di decisione",
  )
)