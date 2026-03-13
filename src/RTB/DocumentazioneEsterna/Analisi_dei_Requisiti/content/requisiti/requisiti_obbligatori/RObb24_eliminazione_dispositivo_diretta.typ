#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo diretta")
    #label(deps.slugify("Eliminazione dispositivo diretta"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo senza effettuare un backup preventivo, previa conferma esplicita.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina dispositivo direttamente")
  ]
)