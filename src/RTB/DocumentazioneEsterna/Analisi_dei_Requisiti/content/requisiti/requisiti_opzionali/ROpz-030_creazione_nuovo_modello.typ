#import "config/deps.typ" as deps
#let req-name="Creazione nuovo modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter creare manualmente un nuovo modello vuoto.
  ],
  fonti:(
    "Crea nuovo modello",
    )
)