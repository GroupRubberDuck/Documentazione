#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome modello nel dettaglio")
    #label(deps.slugify("Visualizzazione nome modello nel dettaglio"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del modello nel dettaglio del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome modello")
  ]
)