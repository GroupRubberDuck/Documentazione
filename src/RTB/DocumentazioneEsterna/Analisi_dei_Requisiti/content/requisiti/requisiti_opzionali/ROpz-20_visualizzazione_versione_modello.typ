#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione versione modello")
    #label(deps.slugify("Visualizzazione versione modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la versione del modello nella lista dei modelli.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza versione modello da lista modelli")
  ]
)