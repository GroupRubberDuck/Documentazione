#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice dipendenza")
    #label(deps.slugify("Visualizzazione codice dipendenza"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice di ogni dipendenza nella lista delle dipendenze del requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice dipendenza")
  ]
)