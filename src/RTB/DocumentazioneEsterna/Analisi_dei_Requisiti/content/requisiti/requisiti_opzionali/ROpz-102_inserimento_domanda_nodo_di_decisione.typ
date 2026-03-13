#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento domanda nodo di decisione")
    #label(deps.slugify("Inserimento domanda nodo di decisione"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)