#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome modello")
    #label(deps.slugify("Visualizzazione nome modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del modello nella lista dei modelli.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome modello da lista modelli")
  ]
)