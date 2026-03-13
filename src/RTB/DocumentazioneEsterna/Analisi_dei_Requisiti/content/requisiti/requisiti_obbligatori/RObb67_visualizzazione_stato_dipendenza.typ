#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato dipendenza")
    #label(deps.slugify("Visualizzazione stato dipendenza"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato di valutazione di ogni dipendenza nella lista delle dipendenze del requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato dipendenza")
  ]

)