#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore domanda vuota")
    #label(deps.slugify("Errore domanda vuota"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)