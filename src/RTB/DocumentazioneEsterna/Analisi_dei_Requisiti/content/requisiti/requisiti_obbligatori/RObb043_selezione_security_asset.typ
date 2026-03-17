#import "config/deps.typ" as deps

#let req-name="Selezione security asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione security asset")
    #label(deps.get-req-code(nome-etichetta:"Selezione security asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo security asset per l'asset.
  ],
  fonti:(
  "Seleziona security asset",
)
)