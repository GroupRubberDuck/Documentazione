#import "config/deps.typ" as deps
#let req-name="Visualizzazione valore nodo foglia"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il valore associato al nodo foglia (Pass, Fail o Not Applicable).
  ],
  fonti:(
    "Visualizza valore nodo foglia",
  )
)