#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica descrizione dispositivo")
    #label(deps.slugify("Modifica descrizione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter modificare la descrizione del dispositivo durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica descrizione dispositivo")
  ]

)