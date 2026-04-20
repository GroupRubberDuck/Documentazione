#import "config/deps.typ" as deps
#let req-name="Visualizzazione lista requisiti modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti associati a un modello nel dettaglio del modello.
  ],
  fonti:(
    "Visualizza lista requisiti modello",
    )
)