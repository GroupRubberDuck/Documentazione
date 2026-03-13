#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento codice nodo di decisione")
    #label(deps.slugify("Inserimento codice nodo di decisione"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)