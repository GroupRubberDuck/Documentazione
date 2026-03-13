#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica domanda vuota")
    #label(deps.slugify("Errore modifica domanda vuota"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)