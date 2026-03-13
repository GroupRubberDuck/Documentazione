#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica nome asset")
    #label(deps.slugify("Modifica nome asset"))
    ],

  descrizione:[
  L'Utente deve poter modificare il nome dell'asset durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica nome asset")
  ]
)