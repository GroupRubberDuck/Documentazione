#import "config/deps.typ" as deps
#let req-name="Visualizzazione decision tree requisito modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la struttura del decision tree associato a un requisito del modello.
  ],
  fonti:(
    "Visualizza decision tree requisito modello",
    )
)