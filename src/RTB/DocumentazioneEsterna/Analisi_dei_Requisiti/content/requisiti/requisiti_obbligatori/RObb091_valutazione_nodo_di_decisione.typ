#import "config/deps.typ" as deps
#let req-name="Valutazione nodo di decisione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire una risposta per il nodo di decisione corrente durante la compilazione del decision tree.
  ],
  fonti:(
    "Valuta nodo di decisione",
    )
)