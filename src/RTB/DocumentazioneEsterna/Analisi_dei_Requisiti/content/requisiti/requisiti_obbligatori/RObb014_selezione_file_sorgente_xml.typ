#import "config/deps.typ" as deps
#let req-name="Selezione file sorgente xml"


#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione file sorgente xml")
    #label(deps.get-req-code(nome-etichetta:"Selezione file sorgente xml"))
    ],

  descrizione:[
  L'Utente deve poter selezionare un file in formato XML come sorgente per l'importazione del dispositivo.
  ],
  fonti:(
    "Selezione file xml",
    )
)