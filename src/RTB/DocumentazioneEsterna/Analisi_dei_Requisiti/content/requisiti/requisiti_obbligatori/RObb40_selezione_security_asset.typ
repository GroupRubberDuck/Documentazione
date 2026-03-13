#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione security asset")
    #label(deps.slugify("Selezione security asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo security asset per l'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona security asset")
  ]
)