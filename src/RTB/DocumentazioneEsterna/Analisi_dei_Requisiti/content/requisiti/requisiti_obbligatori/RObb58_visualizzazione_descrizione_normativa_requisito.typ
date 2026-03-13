#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione descrizione normativa requisito")
    #label(deps.slugify("Visualizzazione descrizione normativa requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione normativa del requisito nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza descrizione normativa")
  ]

)