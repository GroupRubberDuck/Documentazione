#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio requisito")
    #label(deps.slugify("Visualizzazione dettaglio requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di un requisito selezionandolo dalla lista dei requisiti dell'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza in dettaglio requisito")
  ]

)