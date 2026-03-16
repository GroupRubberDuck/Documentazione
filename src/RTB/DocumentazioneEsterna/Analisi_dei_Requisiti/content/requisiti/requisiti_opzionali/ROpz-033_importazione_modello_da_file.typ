#import "config/deps.typ" as deps
#let req-name="Importazione modello da file"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter importare un nuovo modello da file.
  ],
  fonti:(
    "Importa nuovo modello",
    )

)