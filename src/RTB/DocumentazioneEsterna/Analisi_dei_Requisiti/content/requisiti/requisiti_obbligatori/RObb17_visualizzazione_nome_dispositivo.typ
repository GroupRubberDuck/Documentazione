#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome dispositivo")
    #label(deps.slugify("Visualizzazione nome dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome dispositivo")
  #use-case-label(nome-etichetta:"Visualizza nome dispositivo su dashboard")
  ]
)