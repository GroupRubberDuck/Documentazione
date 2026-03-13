#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio nodo modello")
    #label(deps.slugify("Visualizzazione dettaglio nodo modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio delle informazioni legate a uno specifico nodo del decision tree del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio nodo modello decision tree")
  ]
)