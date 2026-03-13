#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice requisito a dettaglio")
    #label(deps.slugify("Visualizzazione codice requisito a dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito a cui è associato il decision tree nel dettaglio del nodo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice requisito a dettaglio")
  ]
)