#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento sistema operativo dispositivo")
    #label(deps.slugify("Inserimento sistema operativo dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter inserire il sistema operativo del dispositivo durante la creazione manuale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserimento sistema operativo dispositivo")
  ]
)