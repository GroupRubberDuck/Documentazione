#import "config/deps.typ" as deps
#let req-name="Visualizzazione decision tree"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il decision tree associato al requisito nel contesto dell'asset.
  ],
  fonti:(
    "Visualizza decision tree",
    )
)