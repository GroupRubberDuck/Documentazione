#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica descrizione asset")
    #label(deps.slugify("Modifica descrizione asset"))
    ],

  descrizione:[
  L'Utente deve poter modificare la descrizione dell'asset durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica descrizione asset")
  ]

)