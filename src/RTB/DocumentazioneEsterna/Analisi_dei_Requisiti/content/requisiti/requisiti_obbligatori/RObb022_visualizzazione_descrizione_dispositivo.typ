#import "config/deps.typ" as deps

#let req-name="Visualizzazione descrizione dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione descrizione dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione descrizione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:(
    "Visualizza descrizione dispositivo",
    "Visualizza descrizione dispositivo su dashboard",
  )
)