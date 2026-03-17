#import "config/deps.typ" as deps

#let req-name="Visualizzazione sistema operativo dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione sistema operativo dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione sistema operativo dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il sistema operativo del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:(
    "Visualizza sistema operativo dispositivo",
    "Visualizza sistema operativo dispositivo su dashboard",
  )
)