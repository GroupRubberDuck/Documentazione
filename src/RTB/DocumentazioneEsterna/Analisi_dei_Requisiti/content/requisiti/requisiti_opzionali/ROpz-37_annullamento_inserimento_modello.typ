#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento inserimento modello")
    #label(deps.slugify("Annullamento inserimento modello"))
    ],

  descrizione:[
  L'Utente deve poter annullare l'operazione di inserimento di un nuovo modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Annulla inserimento modello")
  ]

)