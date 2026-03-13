#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione risposta no")
    #label(deps.slugify("Selezione risposta no"))
    ],

  descrizione:[
  L'Utente deve poter selezionare la risposta No per il nodo di decisione corrente.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Seleziona no")
  ]
)