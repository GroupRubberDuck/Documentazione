#import "config/deps.typ" as deps
#let req-name="Annullamento modifica asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter annullare le modifiche apportate a un asset durante la fase di modifica.
  ],
  fonti:(
    "Annulla modifica asset",
    )
)