#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione modello in json")
    #label(deps.slugify("Esportazione modello in json"))
    ],

  descrizione:[
  L'Utente deve poter esportare il modello in formato JSON.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta modello in JSON")
  ]

)