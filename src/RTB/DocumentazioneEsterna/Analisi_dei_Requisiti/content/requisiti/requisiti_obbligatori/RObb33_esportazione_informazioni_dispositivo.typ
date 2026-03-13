#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo")
    #label(deps.slugify("Esportazione informazioni dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo su file.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta informazioni dispositivo")
  ]
)