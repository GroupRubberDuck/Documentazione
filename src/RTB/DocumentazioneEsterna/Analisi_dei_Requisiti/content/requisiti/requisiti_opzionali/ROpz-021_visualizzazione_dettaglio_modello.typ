#import "config/deps.typ" as deps
#let req-name="Visualizzazione dettaglio modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di uno specifico modello.
  ],
  fonti:(
    "Visualizza dettaglio modello",
    )
)