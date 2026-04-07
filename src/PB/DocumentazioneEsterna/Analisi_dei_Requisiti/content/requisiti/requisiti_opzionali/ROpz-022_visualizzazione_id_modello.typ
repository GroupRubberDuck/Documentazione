#import "config/deps.typ" as deps
#let req-name="Visualizzazione id modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice identificativo del modello nel dettaglio del modello.
  ],
  fonti:(
    "Visualizza id modello",
    )
)