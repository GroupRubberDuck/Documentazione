#import "config/deps.typ" as deps

#let req-name="Selezione file sorgente csv"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione file sorgente csv")
    #label(deps.get-req-code(nome-etichetta:"Selezione file sorgente csv"))
    ],

  descrizione:[
  L'Utente deve poter selezionare un file in formato CSV come sorgente per l'importazione del dispositivo.
  ],
  fonti:(
    "Selezione file csv",
  )
)