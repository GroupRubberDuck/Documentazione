#import "config/deps.typ" as deps
#let req-name="Esportazione report di conformità"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter esportare un report rappresentativo della valutazione del dispositivo.
  ],
  fonti:(
    "Esporta report di conformità",
    )
)