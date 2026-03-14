#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica descrizione requisito")
    #label(deps.slugify("Modifica descrizione requisito"))
    ],

  descrizione:[
  L'Utente deve poter modificare la descrizione di un requisito esistente nel modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica descrizione requisito")
  ]

)