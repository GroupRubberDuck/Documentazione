#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione file sorgente csv")
    #label(deps.slugify("Selezione file sorgente csv"))
    ],

  descrizione:[
  L'Utente deve poter selezionare un file in formato CSV come sorgente per l'importazione del dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Selezione file csv")
  ]
)