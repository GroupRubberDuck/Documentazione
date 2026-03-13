#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica nome dispositivo")
    #label(deps.slugify("Modifica nome dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter annullare le modifiche apportate ai dati del dispositivo durante la fase di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Annulla modifiche dispositivo")
  ]
)