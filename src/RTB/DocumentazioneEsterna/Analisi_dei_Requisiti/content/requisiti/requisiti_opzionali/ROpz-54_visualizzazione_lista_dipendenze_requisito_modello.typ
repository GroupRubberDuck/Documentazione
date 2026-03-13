#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista dipendenze requisito modello")
    #label(deps.slugify("Visualizzazione lista dipendenze requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti da cui dipende il requisito nel contesto del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista dipendenze")
  ]

)