#import "config/deps.typ" as deps
#let req-name="Avvio modifica struttura modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare la struttura di un modello.
  ],
  fonti:(
    "Modifica modello",
    )
)