#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione network asset")
    #label(deps.slugify("Selezione network asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo network asset per l'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona network asset")
  ]
)