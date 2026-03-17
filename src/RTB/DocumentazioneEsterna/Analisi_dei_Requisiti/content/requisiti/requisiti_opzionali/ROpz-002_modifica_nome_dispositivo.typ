#import "config/deps.typ" as deps
#let req-name="Modifica nome dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il nome associato al dispositivo con un nuovo nome di lunghezza compresa tra 1 e 64 caratteri
  ],
  fonti:(
    "Modifica nome dispositivo",
    )
)