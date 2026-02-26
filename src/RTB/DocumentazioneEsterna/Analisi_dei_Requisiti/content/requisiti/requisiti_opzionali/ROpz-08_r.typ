#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "R")
    #label(deps.slugify("R"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)