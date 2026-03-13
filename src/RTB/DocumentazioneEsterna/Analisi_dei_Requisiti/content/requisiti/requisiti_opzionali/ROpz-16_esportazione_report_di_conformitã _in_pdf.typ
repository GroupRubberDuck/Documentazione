#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione report di conformitã  in pdf")
    #label(deps.slugify("Esportazione report di conformitã  in pdf"))
    ],

  descrizione:[
  L'Utente deve poter esportare il report della valutazione del dispositivo in formato PDF.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta report in pdf")
  ]

)