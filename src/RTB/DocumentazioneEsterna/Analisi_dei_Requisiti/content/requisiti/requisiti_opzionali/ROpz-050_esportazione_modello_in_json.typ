#import "config/deps.typ" as deps
#let req-name="Esportazione modello in json"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter esportare il modello in formato JSON.
  ],
  fonti:(
    "Esporta modello in JSON",
    )

)