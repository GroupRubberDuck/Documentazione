#import "config/deps.typ" as deps
#let req-name="Modifica tipo asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il tipo dell'asset durante la fase di modifica.
  ],
  fonti:("Modifica tipo asset",)
)