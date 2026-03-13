#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione elemento lista modelli")
    #label(deps.slugify("Visualizzazione elemento lista modelli"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni singolo elemento nella lista dei modelli.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza elemento lista modelli")
  ]
)