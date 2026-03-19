#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice nodo modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del nodo decisionale nel decision tree del modello.
  ],
  fonti:(
    "Visualizza codice nodo modello",
    )
)