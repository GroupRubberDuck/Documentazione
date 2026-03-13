#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento inserimento dispositivo")
    #label(deps.slugify("Annullamento inserimento dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter annullare la procedura di inserimento di un nuovo dispositivo in qualsiasi momento.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Annullamento inserimento dispositivo")
  ]

)