#import "config/deps.typ" as deps
#let req-name="Modifica codice requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il codice di un requisito esistente nel modello.
  ],
  fonti:(
    "Modifica codice requisito",
  )

)