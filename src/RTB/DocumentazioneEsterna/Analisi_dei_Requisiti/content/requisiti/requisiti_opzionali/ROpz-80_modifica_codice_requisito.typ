#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica codice requisito")
    #label(deps.slugify("Modifica codice requisito"))
    ],

  descrizione:[
  L'Utente deve poter modificare il codice di un requisito esistente nel modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica codice requisito")
  ]

)