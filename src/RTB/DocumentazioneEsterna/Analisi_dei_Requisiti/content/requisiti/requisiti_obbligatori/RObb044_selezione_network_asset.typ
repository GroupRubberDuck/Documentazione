#import "config/deps.typ" as deps

#let req-name = "Selezione network asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione network asset")
    #label(deps.get-req-code(nome-etichetta:"Selezione network asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo network asset per l'asset.
  ],
  fonti:(
    "Seleziona network asset",
  )
  
)