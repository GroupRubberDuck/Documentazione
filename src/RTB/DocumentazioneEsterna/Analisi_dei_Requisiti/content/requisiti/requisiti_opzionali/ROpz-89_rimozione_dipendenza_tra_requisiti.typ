#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Rimozione dipendenza tra requisiti")
    #label(deps.slugify("Rimozione dipendenza tra requisiti"))
    ],

  descrizione:[
  L'Utente deve poter rimuovere una dipendenza tra requisiti del modello durante una sessione di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Rimuovi dipendenza")
  ]
)