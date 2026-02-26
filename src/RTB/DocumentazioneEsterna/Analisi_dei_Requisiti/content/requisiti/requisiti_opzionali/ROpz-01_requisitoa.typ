#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Requisitoa")
    #label(deps.slugify("Requisitoa"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)