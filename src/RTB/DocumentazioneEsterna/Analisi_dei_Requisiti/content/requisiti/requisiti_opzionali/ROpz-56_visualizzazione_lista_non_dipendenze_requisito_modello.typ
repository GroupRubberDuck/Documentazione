#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista non dipendenze requisito modello")
    #label(deps.slugify("Visualizzazione lista non dipendenze requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti da cui non dipende il requisito nel contesto del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista non dipendenze")
  ]
)