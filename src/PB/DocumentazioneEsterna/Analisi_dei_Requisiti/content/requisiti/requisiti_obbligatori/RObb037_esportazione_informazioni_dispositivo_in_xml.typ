#import "config/deps.typ" as deps

#let req-name="Esportazione informazioni dispositivo in xml"

#let data =(


  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione informazioni dispositivo in xml")
    #label(deps.get-req-code(nome-etichetta:"Esportazione informazioni dispositivo in xml"))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni del dispositivo in formato XML.
  ],
  fonti:(
    "Esporta in xml",
    )
)