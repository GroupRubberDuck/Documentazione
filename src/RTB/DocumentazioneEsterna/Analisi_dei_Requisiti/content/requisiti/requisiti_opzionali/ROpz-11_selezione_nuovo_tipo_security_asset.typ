#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione nuovo tipo security asset")
    #label(deps.slugify("Selezione nuovo tipo security asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo security asset come nuovo tipo durante la modifica dell'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona nuovo tipo security asset")
  ]
)