#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione descrizione requisito modello")
    #label(deps.slugify("Visualizzazione descrizione requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione del requisito nel dettaglio del requisito del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza descrizione modello")
  ]
)