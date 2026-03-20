#import "config/deps.typ" as deps
#let req-name="Visualizzazione nodo foglia"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni di un nodo foglia all'interno del decision tree.
  ],
  fonti:(
    "Visualizza nodo foglia",
    )
)