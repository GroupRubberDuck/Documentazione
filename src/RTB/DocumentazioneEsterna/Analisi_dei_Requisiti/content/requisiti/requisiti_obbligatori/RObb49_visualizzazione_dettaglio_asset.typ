#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio asset")
    #label(deps.slugify("Visualizzazione dettaglio asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di uno specifico asset selezionandolo dalla lista.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio asset")
  ]
)