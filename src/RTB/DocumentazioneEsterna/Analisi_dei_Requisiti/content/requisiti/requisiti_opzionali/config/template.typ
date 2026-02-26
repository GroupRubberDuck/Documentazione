#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "{{TITOLO}}")
    #label(deps.slugify("{{TITOLO}}"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)