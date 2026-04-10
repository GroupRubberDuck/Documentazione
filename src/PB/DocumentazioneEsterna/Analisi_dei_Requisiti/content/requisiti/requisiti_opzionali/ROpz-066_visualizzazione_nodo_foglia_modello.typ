#import "config/deps.typ" as deps
#let req-name="Visualizzazione nodo foglia modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni associate a un nodo foglia nel decision tree del modello.
  ],
  fonti:(
    "Visualizza nodo foglia modello",
    )

)