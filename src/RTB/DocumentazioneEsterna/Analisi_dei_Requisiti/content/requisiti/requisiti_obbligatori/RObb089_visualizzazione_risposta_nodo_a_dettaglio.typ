#import "config/deps.typ" as deps
#let req-name="Visualizzazione risposta nodo a dettaglio"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la risposta associata al nodo nel dettaglio del nodo decisionale.
  ],
  fonti:(
    "Visualizza risposta nodo a dettaglio",
    )
)