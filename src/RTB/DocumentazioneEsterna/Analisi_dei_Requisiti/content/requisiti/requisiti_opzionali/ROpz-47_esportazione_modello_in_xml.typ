#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Esportazione modello in xml")
    #label(deps.slugify("Esportazione modello in xml"))
    ],

  descrizione:[
  L'Utente deve poter esportare il modello in formato XML.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Esporta modello in XML")
  ]
)