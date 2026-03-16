#import "config/deps.typ" as deps
#let req-name="Inserimento codice nodo di decisione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire il codice del nodo durante l'aggiunta di un nodo di decisione al decision tree.

  ],
  fonti:(
    "Inserisci codice nodo decision tree",
  )
)