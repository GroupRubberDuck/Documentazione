#import "config/deps.typ" as deps
#let req-name="Visualizzazione elemento lista requisiti modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni singolo elemento nella lista dei requisiti del modello.
  ],
  fonti:(
    "Visualizza singolo elemento lista requisiti modello",
    )


)