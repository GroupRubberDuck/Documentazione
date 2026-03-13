#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento descrizione dispositivo")
    #label(deps.slugify("Inserimento descrizione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter inserire la descrizione del dispositivo durante la creazione manuale.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserimento descrizione dispositivo")
  ]
)