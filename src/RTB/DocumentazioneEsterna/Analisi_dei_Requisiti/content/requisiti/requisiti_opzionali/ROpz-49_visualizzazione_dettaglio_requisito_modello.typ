#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio requisito modello")
    #label(deps.slugify("Visualizzazione dettaglio requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di uno specifico requisito associato a un modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio requisito modello")
  ]
)