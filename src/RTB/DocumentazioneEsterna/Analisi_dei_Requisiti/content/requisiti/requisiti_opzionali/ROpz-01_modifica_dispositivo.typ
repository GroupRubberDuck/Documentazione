#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica dispositivo")
    #label(deps.slugify("Modifica dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter modificare le informazioni di un dispositivo esistente.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica dispositivo")
  ]
)