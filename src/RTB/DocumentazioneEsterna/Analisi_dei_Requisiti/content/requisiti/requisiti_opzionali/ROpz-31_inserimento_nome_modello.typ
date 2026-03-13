#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nome modello")
    #label(deps.slugify("Inserimento nome modello"))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome del modello durante la creazione di un nuovo modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci nome modello")
  ]
)