#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione file sorgente json")
    #label(deps.slugify("Selezione file sorgente json"))
    ],

  descrizione:[
  L'Utente deve poter selezionare un file in formato JSON come sorgente per l'importazione del dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Selezione file json")
  ]

)