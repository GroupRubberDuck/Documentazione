#import "config/deps.typ" as deps
#let req-name="Annullamento inserimento modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter annullare l'operazione di inserimento di un nuovo modello.
  ],
  fonti:(
    "Annulla inserimento modello",
    )

)