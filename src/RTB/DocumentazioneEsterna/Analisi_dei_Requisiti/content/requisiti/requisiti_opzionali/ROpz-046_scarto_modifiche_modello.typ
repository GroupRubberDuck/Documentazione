#import "config/deps.typ" as deps
#let req-name="Scarto modifiche modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter scartare le modifiche apportate alla struttura del modello durante una sessione di modifica.
  ],
  fonti:(
    "Scarta modifica modello",
    )
)