#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato aggregato asset")
    #label(deps.slugify("Visualizzazione stato aggregato asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato aggregato dell'asset sia nella lista che nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato aggregato asset lista asset")
  #use-case-label(nome-etichetta:"Visualizza stato aggregato asset")
  ]
)