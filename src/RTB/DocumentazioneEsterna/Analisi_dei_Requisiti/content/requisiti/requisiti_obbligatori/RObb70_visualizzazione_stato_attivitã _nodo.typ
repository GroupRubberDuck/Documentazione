#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato attivitã  nodo")
    #label(deps.slugify("Visualizzazione stato attivitã  nodo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato di attività di ogni nodo del decision tree (attivo, non attivo).
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato attività")
  ]
)