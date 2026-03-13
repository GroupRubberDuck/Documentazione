#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice dipendenza requisito modello")
    #label(deps.slugify("Visualizzazione codice dipendenza requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice di ogni requisito dipendenza nella lista delle dipendenze del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice dipendenze")
  ]
)