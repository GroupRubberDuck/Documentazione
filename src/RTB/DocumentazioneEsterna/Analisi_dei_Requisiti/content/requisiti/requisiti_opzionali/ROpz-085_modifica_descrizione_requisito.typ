#import "config/deps.typ" as deps
#let req-name="Modifica descrizione requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[

  ],
  fonti:(
    
  )
)