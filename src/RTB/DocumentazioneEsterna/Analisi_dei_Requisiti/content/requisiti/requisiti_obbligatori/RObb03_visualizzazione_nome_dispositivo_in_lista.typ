#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome dispositivo in lista")
    #label(deps.slugify("Visualizzazione nome dispositivo in lista"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome di ogni dispositivo nella lista dei dispositivi.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome dispositivo su lista dispositivi")
  ]

)