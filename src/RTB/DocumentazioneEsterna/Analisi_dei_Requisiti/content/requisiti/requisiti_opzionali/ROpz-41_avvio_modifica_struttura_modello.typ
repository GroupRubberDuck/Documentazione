#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Avvio modifica struttura modello")
    #label(deps.slugify("Avvio modifica struttura modello"))
    ],

  descrizione:[
  L'Utente deve poter avviare una sessione di modifica della struttura di un modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Avvia modifica modello")
  ]
)