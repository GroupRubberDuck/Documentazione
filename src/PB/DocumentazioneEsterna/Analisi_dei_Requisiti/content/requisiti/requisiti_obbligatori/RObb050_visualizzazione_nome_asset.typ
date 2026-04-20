#import "config/deps.typ" as deps

#let req-name="Visualizzazione nome asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome asset")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione nome asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome dell'asset sia nella lista che nel vista in dettaglio dell'asset.
  ],
  fonti:(
    "Visualizza nome asset lista asset",
    "Visualizza nome asset",
  )
)