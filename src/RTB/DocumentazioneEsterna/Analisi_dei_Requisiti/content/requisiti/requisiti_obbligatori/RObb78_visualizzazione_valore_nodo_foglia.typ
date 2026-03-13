#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione valore nodo foglia")
    #label(deps.slugify("Visualizzazione valore nodo foglia"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il valore associato al nodo foglia (Pass, Fail o Not Applicable).
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza valore nodo foglia")
  ]
)