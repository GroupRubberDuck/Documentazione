#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica descrizione requisito")
    #label(deps.slugify("Modifica descrizione requisito"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)