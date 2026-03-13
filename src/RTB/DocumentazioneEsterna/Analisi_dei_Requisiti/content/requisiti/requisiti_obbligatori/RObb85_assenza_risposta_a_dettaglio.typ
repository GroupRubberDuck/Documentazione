#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Assenza risposta a dettaglio")
    #label(deps.slugify("Assenza risposta a dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un'indicazione visiva che il nodo non ha ancora una risposta associata nel dettaglio del nodo decisionale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Mostra assenza di risposta a dettaglio")
  ]
)