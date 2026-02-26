#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Prova")
    #label(deps.slugify("Prova"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)