#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione modello")
    #label(deps.slugify("Esportazione modello"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni di un modello su file.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta modello")
  ]
)