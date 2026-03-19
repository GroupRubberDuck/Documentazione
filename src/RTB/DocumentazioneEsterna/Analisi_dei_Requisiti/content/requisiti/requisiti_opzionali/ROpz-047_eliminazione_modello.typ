#import "config/deps.typ" as deps
#let req-name="Eliminazione modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter eliminare un modello esistente dal sistema.
  ],
  fonti:(
    "Elimina modello",
    )

)