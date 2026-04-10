#import "config/deps.typ" as deps
#let req-name="Modifica anagrafica modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare l'anagrafica di un modello esistente.
  ],
  fonti:(
    "Modifica anagrafica modello",
    )
)