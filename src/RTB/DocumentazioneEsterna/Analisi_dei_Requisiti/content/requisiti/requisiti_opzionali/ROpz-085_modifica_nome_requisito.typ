#import "config/deps.typ" as deps
#let req-name="Modifica nome requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il nome di un requisito esistente nel modello, inserendo un nuovo nome di lunghezza compresa tra 1 e 64 caratteri.
  ],
  fonti:(
    "Modifica nome requisito",
    )
)