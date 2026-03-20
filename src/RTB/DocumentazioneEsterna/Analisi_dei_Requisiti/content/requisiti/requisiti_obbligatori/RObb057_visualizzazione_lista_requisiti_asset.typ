#import "config/deps.typ" as deps
#let req-name="Visualizzazione lista requisiti asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti applicabili all'asset nel contesto della sessione di valutazione.
  ],
  fonti:(
    "Visualizza lista requisiti asset",
    )

)