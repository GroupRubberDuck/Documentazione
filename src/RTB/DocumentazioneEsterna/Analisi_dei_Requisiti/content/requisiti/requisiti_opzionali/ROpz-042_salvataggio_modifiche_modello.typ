#import "config/deps.typ" as deps
#let req-name="Salvataggio modifiche modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter salvare in modo definitivo le modifiche apportate alla struttura del modello.
  ],
  fonti:(
    "Salva modifica modello",
  )
)