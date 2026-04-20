#import "config/deps.typ" as deps

#let req-name="Visualizzazione modello associato al dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione modello associato al dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione modello associato al dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il modello di standard associato al dispositivo.
  ],
  fonti:(
    "Visualizza modello associato al dispositivo",
    )
)