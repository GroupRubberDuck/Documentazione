#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Scarto modifiche modello")
    #label(deps.slugify("Scarto modifiche modello"))
    ],

  descrizione:[
  L'Utente deve poter scartare le modifiche apportate alla struttura del modello durante una sessione di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Scarta modifica modello")
  ]
)