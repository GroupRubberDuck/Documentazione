#import "config/deps.typ" as deps
#let req-name="Visualizzazione elemento lista modelli"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni singolo elemento nella lista dei modelli.
  ],
  fonti:(
    "Visualizza elemento lista modelli",
    )
)