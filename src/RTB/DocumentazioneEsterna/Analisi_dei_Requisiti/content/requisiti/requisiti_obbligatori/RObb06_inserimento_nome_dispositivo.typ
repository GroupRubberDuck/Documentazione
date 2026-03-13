#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nome dispositivo")
    #label(deps.slugify("Inserimento nome dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome del dispositivo durante la creazione manuale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserimento nome dispositivo")
  ]
)