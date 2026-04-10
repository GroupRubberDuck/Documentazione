#import "config/deps.typ" as deps
#let req-name="Esportazione modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter esportare le informazioni di un modello su file.
  ],
  fonti:(
    "Esporta modello",
    )
)