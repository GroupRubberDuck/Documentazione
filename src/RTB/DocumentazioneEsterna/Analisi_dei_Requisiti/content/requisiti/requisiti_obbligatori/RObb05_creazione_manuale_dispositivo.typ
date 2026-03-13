#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Creazione manuale dispositivo")
    #label(deps.slugify("Creazione manuale dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter creare un nuovo dispositivo inserendo manualmente i dati richiesti.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Crea nuovo dispositivo")
  ]

)