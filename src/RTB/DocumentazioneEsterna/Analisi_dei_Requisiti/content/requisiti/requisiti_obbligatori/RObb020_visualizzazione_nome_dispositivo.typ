#import "config/deps.typ" as deps

#let req-name="Visualizzazione nome dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione nome dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:(
    "Visualizza nome dispositivo",
    "Visualizza nome dispositivo su dashboard",
  )
)