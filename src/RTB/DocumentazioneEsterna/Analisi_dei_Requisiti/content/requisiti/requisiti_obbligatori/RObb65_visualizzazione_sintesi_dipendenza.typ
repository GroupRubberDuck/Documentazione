#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione sintesi dipendenza")
    #label(deps.slugify("Visualizzazione sintesi dipendenza"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni sintetiche di ogni dipendenza nella lista delle dipendenze del requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza sintesi dipendenza")
  ]
)