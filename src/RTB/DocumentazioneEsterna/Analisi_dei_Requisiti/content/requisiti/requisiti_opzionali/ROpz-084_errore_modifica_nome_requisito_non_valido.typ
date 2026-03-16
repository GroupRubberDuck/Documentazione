#import "config/deps.typ" as deps
#let req-name="Errore modifica nome requisito non valido"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[

  ],
  fonti:(
    "Errore modifica nome requisito non valido",
  )
)