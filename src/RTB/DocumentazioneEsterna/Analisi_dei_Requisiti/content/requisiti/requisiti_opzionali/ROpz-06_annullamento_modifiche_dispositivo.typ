#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento modifiche dispositivo")
    #label(deps.slugify("Annullamento modifiche dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter annullare le modifiche apportate ai dati del dispositivo durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Annulla modifiche dispositivo")
  ]

)