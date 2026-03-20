#import "config/deps.typ" as deps

#let req-name="Visualizzazione nome modello associato"


#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome modello associato")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione nome modello associato"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del modello di standard associato al dispositivo.
  ],
  fonti:(
    "Visualizza nome modello associato",
    )
)