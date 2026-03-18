#import "config/deps.typ" as deps
#let req-name="Visualizzazione dettaglio nodo decisionale"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di un nodo decisionale attivo selezionandolo dal decision tree.
  ],
  fonti:(
    "Visualizza dettaglio nodo decisionale",
    )
)