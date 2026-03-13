#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dati dispositivo")
    #label(deps.slugify("Visualizzazione dati dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di un dispositivo selezionandolo dalla lista.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dati dispositivo")
  ]

)