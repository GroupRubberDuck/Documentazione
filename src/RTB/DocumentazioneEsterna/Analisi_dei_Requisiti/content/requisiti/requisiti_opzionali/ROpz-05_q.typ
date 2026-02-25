#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Q")
    #label(deps.slugify("Q"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)