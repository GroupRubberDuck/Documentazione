#import "config/deps.typ" as deps
#let req-name="Modifica anagrafica requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare l'anagrafica di un requisito esistente nel modello.
  ],
  fonti:(
    "Modifica anagrafica requisito",
    )
)