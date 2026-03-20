#import "config/deps.typ" as deps
#let req-name="Modifica nome modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il nome del modello durante la modifica dell'anagrafica.

  Il nuovo nome deve avere una lunghezza compresa tra 1 e 32 caratteri
  ],
  fonti:(
    "Modifica nome modello",
    )
)