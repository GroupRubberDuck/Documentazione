#import "config/deps.typ" as deps
#let req-name="Visualizzazione dettaglio nodo modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio delle informazioni legate a uno specifico nodo del decision tree del modello.
  ],
  fonti:(
    "Visualizza dettaglio nodo modello decision tree",
    )
)