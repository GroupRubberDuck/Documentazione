#import "config/deps.typ" as deps
#let req-name="Visualizzazione versione modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la versione del modello nella lista dei modelli.
  ],
  fonti:(
    "Visualizza versione modello da lista modelli",
    )
)