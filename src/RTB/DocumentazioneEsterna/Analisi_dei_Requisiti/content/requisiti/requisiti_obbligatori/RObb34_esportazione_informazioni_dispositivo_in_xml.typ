#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo in xml")
    #label(deps.slugify("Esportazione informazioni dispositivo in xml"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo in formato XML.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta in xml")
  ]
)