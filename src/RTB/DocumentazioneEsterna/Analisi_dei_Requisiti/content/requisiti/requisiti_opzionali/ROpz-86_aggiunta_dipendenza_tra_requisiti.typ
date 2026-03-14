#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta dipendenza tra requisiti")
    #label(deps.slugify("Aggiunta dipendenza tra requisiti"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere una dipendenza tra requisiti del modello durante una sessione di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi dipendenza")
  ]

)