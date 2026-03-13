#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice requisito modello in lista")
    #label(deps.slugify("Visualizzazione codice requisito modello in lista"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito nella lista dei requisiti del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice requisito da lista requisiti modello")
  ]
)