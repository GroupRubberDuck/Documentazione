#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento modifica asset")
    #label(deps.slugify("Annullamento modifica asset"))
    ],

  descrizione:[
  L'Utente deve poter annullare le modifiche apportate a un asset durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Annulla modifica asset")
  ]
)