#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione nuovo tipo network asset")
    #label(deps.slugify("Selezione nuovo tipo network asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo network asset come nuovo tipo durante la modifica dell'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona nuovo tipo network asset")
  ]
)