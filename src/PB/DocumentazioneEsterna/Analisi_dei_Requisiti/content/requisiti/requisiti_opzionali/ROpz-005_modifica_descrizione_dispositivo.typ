#import "config/deps.typ" as deps
#let req-name="Modifica descrizione dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare la descrizione del dispositivo durante la fase di modifica.
  ],
  fonti:(
    "Modifica descrizione dispositivo",
  )

)