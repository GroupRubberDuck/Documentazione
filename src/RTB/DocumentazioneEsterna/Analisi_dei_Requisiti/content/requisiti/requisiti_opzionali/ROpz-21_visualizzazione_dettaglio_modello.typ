#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio modello")
    #label(deps.slugify("Visualizzazione dettaglio modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di uno specifico modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio modello")
  ]
)