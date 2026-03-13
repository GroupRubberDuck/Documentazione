#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Raggiungimento nodo foglia")
    #label(deps.slugify("Raggiungimento nodo foglia"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare una notifica di completamento del percorso decisionale ed essere reindirizzato al dettaglio del requisito quando il nodo successore è un nodo foglia.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Nodo successore foglia")
  ]
)