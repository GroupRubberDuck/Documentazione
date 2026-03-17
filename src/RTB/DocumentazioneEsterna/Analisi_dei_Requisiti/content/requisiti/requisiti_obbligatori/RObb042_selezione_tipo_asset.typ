#import "config/deps.typ" as deps

#let req-name = "Selezione tipo asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione tipo asset")
    #label(deps.get-req-code(nome-etichetta:"Selezione tipo asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo dell'asset durante l'aggiunta.
  ],
  fonti:(

    "Seleziona tipo asset",
  )
)