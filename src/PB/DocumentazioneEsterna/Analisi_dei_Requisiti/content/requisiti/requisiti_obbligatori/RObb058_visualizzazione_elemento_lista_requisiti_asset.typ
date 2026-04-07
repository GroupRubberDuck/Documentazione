#import "config/deps.typ" as deps
#let req-name="Visualizzazione elemento lista requisiti asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni requisito nella lista dei requisiti dell'asset.
  ],
  fonti:(
    "Visualizza elemento lista requisiti asset",
)
)