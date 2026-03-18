#import "config/deps.typ" as deps
#let req-name="Modifica codice requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il codice di un requisito esistente nel modello.
  Il nuovo nome del requisito deve avere una lunghezza compresa tra 4 e 10 caratteri e non deve già appartenere a un'altro requisito
  ],
  fonti:(
    "Modifica codice requisito",
  )

)