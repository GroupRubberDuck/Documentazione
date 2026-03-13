#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione sistema operativo dispositivo")
    #label(deps.slugify("Visualizzazione sistema operativo dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il sistema operativo del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza sistema operativo dispositivo")
  #use-case-label(nome-etichetta:"Visualizza sistema operativo dispositivo su dashboard")
  ]
)