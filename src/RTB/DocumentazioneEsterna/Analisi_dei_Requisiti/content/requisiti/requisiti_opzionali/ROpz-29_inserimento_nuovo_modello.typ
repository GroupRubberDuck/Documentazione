#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nuovo modello")
    #label(deps.slugify("Inserimento nuovo modello"))
    ],

  descrizione:[
  L'Utente deve poter inserire un nuovo modello nel sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci nuovo modello")
  ]
)