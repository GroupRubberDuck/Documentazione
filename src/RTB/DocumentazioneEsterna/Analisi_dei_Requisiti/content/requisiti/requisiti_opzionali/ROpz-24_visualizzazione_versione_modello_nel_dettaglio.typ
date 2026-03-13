#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione versione modello nel dettaglio")
    #label(deps.slugify("Visualizzazione versione modello nel dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il numero di versione del modello nel dettaglio del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza versione modello")
  ]
)