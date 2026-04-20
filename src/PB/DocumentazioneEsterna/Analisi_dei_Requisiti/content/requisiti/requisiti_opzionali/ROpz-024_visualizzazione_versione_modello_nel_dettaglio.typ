#import "config/deps.typ" as deps
#let req-name="Visualizzazione versione modello nel dettaglio"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il numero di versione del modello nel dettaglio del modello.
  ],
  fonti:(
    "Visualizza versione modello",
    )
)