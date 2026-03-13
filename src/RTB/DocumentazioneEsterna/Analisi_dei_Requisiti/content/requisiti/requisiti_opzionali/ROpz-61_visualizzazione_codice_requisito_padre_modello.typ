#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice requisito padre modello")
    #label(deps.slugify("Visualizzazione codice requisito padre modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito a cui è associato il decision tree nel nodo decisionale del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice requisito padre modello")
  ]
)