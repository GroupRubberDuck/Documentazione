#import "config/deps.typ" as deps
#let req-name="Selezione risposta yes"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter selezionare la risposta Yes per il nodo di decisione corrente.
  ],
  fonti:(
    "Seleziona yes",
    )
)