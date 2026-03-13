#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica nome requisito")
    #label(deps.slugify("Modifica nome requisito"))
    ],

  descrizione:[
  L'Utente deve poter modificare il nome di un requisito esistente nel modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica nome requisito")
  ]
)