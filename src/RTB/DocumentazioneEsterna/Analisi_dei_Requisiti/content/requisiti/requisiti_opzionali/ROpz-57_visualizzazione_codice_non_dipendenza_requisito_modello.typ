#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice non dipendenza requisito modello")
    #label(deps.slugify("Visualizzazione codice non dipendenza requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice di ogni requisito nella lista delle non dipendenze del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice non dipendenze")
  ]
)