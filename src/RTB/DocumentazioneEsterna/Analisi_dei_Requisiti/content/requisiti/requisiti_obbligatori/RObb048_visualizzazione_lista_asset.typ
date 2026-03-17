#import "config/deps.typ" as deps

#let req-name="Visualizzazione lista asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista asset")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione lista asset"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista degli asset associati al dispositivo nella dashboard.
  ],
  fonti:(
    "Visualizza lista asset",
    )

)