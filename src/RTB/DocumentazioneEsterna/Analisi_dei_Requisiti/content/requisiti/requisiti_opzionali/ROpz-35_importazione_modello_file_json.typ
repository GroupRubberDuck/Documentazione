#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Importazione modello file json")
    #label(deps.slugify("Importazione modello file json"))
    ],

  descrizione:[
  L'Utente deve poter importare un modello da un file in formato JSON.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Importa modello file JSON")
  ]
)