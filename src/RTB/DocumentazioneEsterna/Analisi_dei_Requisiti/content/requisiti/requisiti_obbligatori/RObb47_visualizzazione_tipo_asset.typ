#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione tipo asset")
    #label(deps.slugify("Visualizzazione tipo asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il tipo dell'asset sia nella lista che nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza tipo asset lista asset")
  #use-case-label(nome-etichetta:"Visualizza tipo asset")
  ]
)