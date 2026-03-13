#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica sistema operativo dispositivo")
    #label(deps.slugify("Modifica sistema operativo dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter modificare il sistema operativo del dispositivo durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica sistema operativo dispositivo")
  ]

)