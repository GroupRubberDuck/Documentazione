#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo in json")
    #label(deps.slugify("Esportazione informazioni dispositivo in json"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo in formato JSON.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta in json")
  ]
)