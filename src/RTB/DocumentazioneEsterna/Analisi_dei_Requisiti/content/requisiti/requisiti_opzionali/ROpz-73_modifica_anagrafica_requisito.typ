#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica anagrafica requisito")
    #label(deps.slugify("Modifica anagrafica requisito"))
    ],

  descrizione:[
  L'Utente deve poter modificare l'anagrafica di un requisito esistente nel modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica anagrafica requisito")
  ]
)