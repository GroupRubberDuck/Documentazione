#import "config/deps.typ" as deps

#let req-name="Visualizzazione tipo asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il tipo dell'asset sia nella lista che nel vista in dettaglio dell'asset.
  ],
  fonti:(
    "Visualizza tipo asset lista asset",
    "Visualizza tipo asset",
    )
  
)