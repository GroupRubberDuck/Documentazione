#import "config/deps.typ" as deps

#let req-name="Visualizzazione stato attività nodo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato di attività di ogni nodo del decision tree (attivo, non attivo).
  ],
  fonti:(
    "Visualizza stato attività",
    )
)


