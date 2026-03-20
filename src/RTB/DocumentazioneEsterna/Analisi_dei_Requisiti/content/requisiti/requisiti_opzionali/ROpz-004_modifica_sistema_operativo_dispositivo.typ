#import "config/deps.typ" as deps
#let req-name="Modifica sistema operativo dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il sistema operativo del dispositivo durante la fase di modifica.
  ],
  fonti:(
    "Modifica sistema operativo dispositivo",
    )

)