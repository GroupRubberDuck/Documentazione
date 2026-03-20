#import "config/deps.typ" as deps
#let req-name="Navigazione nodo precedente"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter tornare al nodo precedente del decision tree per modificare una risposta già inserita.
  ],
  fonti:(
    "Vai al nodo precedente",
    )
)