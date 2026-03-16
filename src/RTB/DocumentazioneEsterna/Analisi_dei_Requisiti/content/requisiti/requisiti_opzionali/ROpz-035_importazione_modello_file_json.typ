#import "config/deps.typ" as deps
#let req-name="Importazione modello file json"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter importare un modello da un file in formato JSON.
  ],
  fonti:(
    "Importa modello file JSON",
    )
)