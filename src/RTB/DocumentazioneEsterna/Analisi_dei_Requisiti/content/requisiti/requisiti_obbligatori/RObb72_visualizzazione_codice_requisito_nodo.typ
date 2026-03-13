#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice requisito nodo")
    #label(deps.slugify("Visualizzazione codice requisito nodo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito a cui è associato il decision tree nel nodo di decisione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice requisito dt")
  ]
)