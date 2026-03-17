#import "config/deps.typ" as deps
#let req-name="Selezione file sorgente json"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione file sorgente json")
    #label(deps.get-req-code(nome-etichetta:"Selezione file sorgente json"))
    ],

  descrizione:[
  L'Utente deve poter selezionare un file in formato JSON come sorgente per l'importazione del dispositivo.
  ],
  fonti:(
    "Selezione file json",
    )


)