#import "config/deps.typ" as deps
#let req-name="Eliminazione requisito dal modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter eliminare un requisito dal modello durante una sessione di modifica.
  ],
  fonti:(
    "Elimina requisito",
    )
)