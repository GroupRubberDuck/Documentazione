#import "config/deps.typ" as deps
#let req-name="Visualizzazione lista non dipendenze requisito modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei requisiti da cui non dipende il requisito nel contesto del modello.
  ],
  fonti:(
    "Visualizza lista non dipendenze",
    )
)