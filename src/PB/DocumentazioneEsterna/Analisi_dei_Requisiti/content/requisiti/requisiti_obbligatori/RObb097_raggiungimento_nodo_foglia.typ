#import "config/deps.typ" as deps
#let req-name="Raggiungimento nodo foglia"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare una notifica di completamento del percorso decisionale ed essere reindirizzato al dettaglio del requisito quando il nodo successore è un nodo foglia.
  ],
  fonti:(
    "Nodo successore foglia",
    )
)