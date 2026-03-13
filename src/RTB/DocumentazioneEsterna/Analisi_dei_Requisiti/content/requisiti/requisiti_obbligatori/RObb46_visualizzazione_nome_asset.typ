#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome asset")
    #label(deps.slugify("Visualizzazione nome asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome dell'asset sia nella lista che nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome asset lista asset")
  #use-case-label(nome-etichetta:"Visualizza nome asset")
  ]
)