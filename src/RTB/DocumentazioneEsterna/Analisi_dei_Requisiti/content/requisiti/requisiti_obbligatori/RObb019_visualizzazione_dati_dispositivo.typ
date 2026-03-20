#import "config/deps.typ" as deps

#let req-name="Visualizzazione dati dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dati dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione dati dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare i dati del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:(
    "Visualizza dati dispositivo",
    "Visualizza dati dispositivo su dashboard",
  )

)