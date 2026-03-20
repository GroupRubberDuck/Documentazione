#import "config/deps.typ" as deps
#let req-name="Esportazione report di conformità in pdf"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter esportare un report in formato pdf rappresentativo della valutazione del dispositivo.

  ],
  fonti:(
    "Esporta report in PDF",
  )
)