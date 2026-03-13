#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione decision tree requisito modello")
    #label(deps.slugify("Visualizzazione decision tree requisito modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la struttura del decision tree associato a un requisito del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza decision tree requisito modello")
  ]
)