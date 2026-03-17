#import "config/deps.typ" as deps

#let req-name="Visualizzazione versione modello associato"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione versione modello associato")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione versione modello associato"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la versione del modello di standard associato al dispositivo.
  ],
  fonti:(
    "Visualizza versione modello associato",
    )
  
)