#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione decision tree")
    #label(deps.slugify("Visualizzazione decision tree"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il decision tree associato al requisito nel contesto dell'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza decision tree")
  ]
)