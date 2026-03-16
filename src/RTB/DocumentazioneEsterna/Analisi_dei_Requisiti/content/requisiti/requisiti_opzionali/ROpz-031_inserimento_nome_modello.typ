#import "config/deps.typ" as deps
#let req-name="Inserimento nome modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome del modello durante la creazione di un nuovo modello.
  ],
  fonti:(
    "Inserisci nome modello",
    )
)