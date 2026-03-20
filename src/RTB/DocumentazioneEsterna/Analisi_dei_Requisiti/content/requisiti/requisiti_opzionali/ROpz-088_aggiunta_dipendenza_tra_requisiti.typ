#import "config/deps.typ" as deps
#let req-name="Aggiunta dipendenza tra requisiti"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter aggiungere una dipendenza tra requisiti del modello durante una sessione di modifica.

  ],
  fonti:(
    "Aggiungi dipendenza",
  )
)