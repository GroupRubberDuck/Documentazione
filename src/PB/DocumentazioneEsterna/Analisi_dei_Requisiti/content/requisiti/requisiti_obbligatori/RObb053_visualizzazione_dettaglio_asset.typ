#import "config/deps.typ" as deps
#let req-name="Visualizzazione dettaglio asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di uno specifico asset selezionandolo dalla lista.
  ],
  fonti:(
    "Visualizza dettaglio asset",
    )
)