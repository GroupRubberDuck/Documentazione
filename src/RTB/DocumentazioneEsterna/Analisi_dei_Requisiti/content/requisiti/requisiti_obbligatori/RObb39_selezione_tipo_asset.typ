#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione tipo asset")
    #label(deps.slugify("Selezione tipo asset"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il tipo dell'asset durante l'aggiunta.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona tipo asset")
  ]
)