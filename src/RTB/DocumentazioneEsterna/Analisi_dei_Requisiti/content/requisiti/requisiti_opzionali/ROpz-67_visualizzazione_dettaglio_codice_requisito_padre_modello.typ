#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio codice requisito padre modello")
    #label(deps.slugify("Visualizzazione dettaglio codice requisito padre modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito padre nel dettaglio del nodo decisionale del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio codice requisito padre modello")
  ]
)