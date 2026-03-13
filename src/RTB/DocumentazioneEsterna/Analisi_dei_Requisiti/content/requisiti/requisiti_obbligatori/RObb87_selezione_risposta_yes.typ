#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione risposta yes")
    #label(deps.slugify("Selezione risposta yes"))
    ],

  descrizione:[
  L'Utente deve poter selezionare la risposta Yes per il nodo di decisione corrente.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona yes")
  ]
)