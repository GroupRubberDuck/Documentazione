#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "C")
    #label(deps.slugify("C"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)