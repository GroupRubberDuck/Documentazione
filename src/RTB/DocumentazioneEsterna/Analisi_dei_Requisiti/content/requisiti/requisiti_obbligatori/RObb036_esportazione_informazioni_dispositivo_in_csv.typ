#import "config/deps.typ" as deps

#let req-name="Esportazione informazioni dispositivo in csv"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo in csv")
    #label(deps.get-req-code(nome-etichetta:"Esportazione informazioni dispositivo in csv"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo in formato CSV.
  ],
  fonti:(
    "Esporta in csv",
  )
)