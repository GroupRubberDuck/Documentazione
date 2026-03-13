#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione elemento lista requisiti asset")
    #label(deps.slugify("Visualizzazione elemento lista requisiti asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni requisito nella lista dei requisiti dell'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza elemento lista requisiti asset")
  ]
)