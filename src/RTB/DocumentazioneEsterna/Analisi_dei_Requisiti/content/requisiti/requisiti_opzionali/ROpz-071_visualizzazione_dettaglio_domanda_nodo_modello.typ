#import "config/deps.typ" as deps
#let req-name="Visualizzazione dettaglio domanda nodo modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la domanda associata al nodo nel dettaglio del nodo decisionale del modello.
  ],
  fonti:(
    "Visualizza dettaglio domanda nodo modello",
    )

)