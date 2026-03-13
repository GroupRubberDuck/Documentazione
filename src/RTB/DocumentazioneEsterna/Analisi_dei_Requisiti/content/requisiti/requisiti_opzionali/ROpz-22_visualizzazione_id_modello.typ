#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione id modello")
    #label(deps.slugify("Visualizzazione id modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice identificativo del modello nel dettaglio del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza id modello")
  ]
)