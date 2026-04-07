#import "config/deps.typ" as deps
#let req-name="Selezione nuovo tipo network asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo network asset come nuovo tipo durante la modifica dell'asset.
  ],
  fonti:(
    "Seleziona nuovo tipo network asset",
    )
)