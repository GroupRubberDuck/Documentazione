#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice nodo a dettaglio"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo nel dettaglio del nodo decisionale.
  ],
  fonti:(
    "Visualizza codice nodo a dettaglio",
  )

)