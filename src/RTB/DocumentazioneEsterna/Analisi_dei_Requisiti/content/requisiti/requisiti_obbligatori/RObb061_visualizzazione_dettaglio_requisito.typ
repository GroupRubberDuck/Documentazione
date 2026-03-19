#import "config/deps.typ" as deps
#let req-name="Visualizzazione dettaglio requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di un requisito selezionandolo dalla lista dei requisiti dell'asset.
  ],
  fonti:(

    "Visualizza dettaglio requisito",
  )

)