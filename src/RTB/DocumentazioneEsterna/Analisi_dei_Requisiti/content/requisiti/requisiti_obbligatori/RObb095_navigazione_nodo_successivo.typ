#import "config/deps.typ" as deps
#let req-name="Navigazione nodo successivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter navigare al nodo successivo del decision tree dopo aver selezionato una risposta.
  ],
  fonti:(
    "Vai al nodo successivo",
    )
)