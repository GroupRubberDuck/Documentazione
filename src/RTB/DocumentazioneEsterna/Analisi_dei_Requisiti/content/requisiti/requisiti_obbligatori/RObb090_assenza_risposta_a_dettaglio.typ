#import "config/deps.typ" as deps
#let req-name="Assenza risposta a dettaglio"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un'indicazione visiva che il nodo non ha ancora una risposta associata nel dettaglio del nodo decisionale.
  ],
  fonti:(
    "Mostra assenza di risposta a dettaglio",
    )
)