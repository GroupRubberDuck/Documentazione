#import "config/deps.typ" as deps
#let req-name="Inserimento nuovo modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire un nuovo modello nel sistema.
  ],
  fonti:(
    "Inserisci nuovo modello",
    )
)