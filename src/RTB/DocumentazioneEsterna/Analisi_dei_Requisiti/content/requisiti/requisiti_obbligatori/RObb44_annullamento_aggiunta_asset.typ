#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento aggiunta asset")
    #label(deps.slugify("Annullamento aggiunta asset"))
    ],

  descrizione:[
  L'Utente deve poter annullare la procedura di aggiunta di un nuovo asset in qualsiasi momento.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Annulla aggiunta asset")
  ]
)