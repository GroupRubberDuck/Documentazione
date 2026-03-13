#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio nodo decisione modello")
    #label(deps.slugify("Visualizzazione dettaglio nodo decisione modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio di uno specifico nodo decisionale nel decision tree del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio nodo decisione modello")
  ]

)