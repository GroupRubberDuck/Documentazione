#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione report di conformitã ")
    #label(deps.slugify("Esportazione report di conformitã "))
    ],

  descrizione:[
  L'Utente deve poter esportare un report rappresentativo della valutazione del dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta report di conformità")
  ]
)