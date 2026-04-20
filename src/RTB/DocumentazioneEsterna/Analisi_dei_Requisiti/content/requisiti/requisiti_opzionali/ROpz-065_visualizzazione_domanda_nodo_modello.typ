#import "config/deps.typ" as deps
#let req-name="Visualizzazione domanda nodo modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la domanda associata al nodo decisionale nel decision tree del modello.
  ],
  fonti:(
    "Visualizza domanda nodo modello",
    )
)