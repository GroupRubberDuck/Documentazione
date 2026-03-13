#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista asset")
    #label(deps.slugify("Visualizzazione lista asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista degli asset associati al dispositivo nella dashboard.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista asset")
  ]
)