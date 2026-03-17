#import "config/deps.typ" as deps
#let req-name="Inserimento nome modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome del modello durante la creazione di un nuovo modello.
  Il nome del modello deve essere compreso tra 1 e 32 caratteri
  ],
  fonti:(
    "Inserisci nome modello",
    )
)