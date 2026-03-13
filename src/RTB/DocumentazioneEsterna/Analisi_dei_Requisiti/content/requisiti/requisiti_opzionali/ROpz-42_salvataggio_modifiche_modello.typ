#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio modifiche modello")
    #label(deps.slugify("Salvataggio modifiche modello"))
    ],

  descrizione:[
  L'Utente deve poter salvare in modo definitivo le modifiche apportate alla struttura del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Salva modifica modello")
  ]
)