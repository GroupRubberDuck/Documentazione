#import "config/deps.typ" as deps
#let req-name="Esportazione informazioni dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Esportazione informazioni dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo su file.
  ],
  fonti:(
      "Esporta informazioni dispositivo",
    )
)