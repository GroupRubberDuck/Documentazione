#import "config/deps.typ" as deps

#let req-name="Visualizzazione dati dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dati dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione dati dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di un dispositivo selezionandolo dalla lista.
  ],
  fonti:(
    "Visualizza dati dispositivo",
  )

)