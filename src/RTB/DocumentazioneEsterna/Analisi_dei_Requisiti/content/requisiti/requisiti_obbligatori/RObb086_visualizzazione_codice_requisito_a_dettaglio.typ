#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice requisito a dettaglio"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito a cui è associato il decision tree nel dettaglio del nodo.
  ],
  fonti:(
    "Visualizza codice requisito a dettaglio",
    )
)