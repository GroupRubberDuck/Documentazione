#import "config/deps.typ" as deps
#let req-name="Annullamento modifiche dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter annullare le modifiche apportate ai dati del dispositivo durante la fase di modifica.
  ],
  fonti:(
    "Annulla modifiche dispositivo",
    )

)