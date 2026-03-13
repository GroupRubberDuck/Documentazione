#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo in csv")
    #label(deps.slugify("Esportazione informazioni dispositivo in csv"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo in formato CSV.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta in csv")
  ]
)