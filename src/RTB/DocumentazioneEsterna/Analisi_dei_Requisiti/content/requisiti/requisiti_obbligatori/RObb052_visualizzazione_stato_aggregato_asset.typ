#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato aggregato asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato aggregato dell'asset sia nella lista che nel vista in dettaglio dell'asset
  ],
  fonti:(

    "Visualizza stato aggregato asset lista asset",
    "Visualizza stato aggregato asset",
  )
)