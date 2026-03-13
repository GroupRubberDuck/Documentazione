#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore dipendenza circolare")
    #label(deps.slugify("Errore dipendenza circolare"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)