#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta asset")
    #label(deps.slugify("Aggiunta asset"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nuovo asset al dispositivo durante la sessione di valutazione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiunta asset")
  ]

)