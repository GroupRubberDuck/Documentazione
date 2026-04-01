#import "config/deps.typ" as deps
#let req-name="Aggiunta nodo foglia pass"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nodo foglia con valore PASS allo scheletro del decision tree durante una sessione di modifica del modello.

  ],
  fonti:(
    "Aggiungi nodo PASS",
  )
)