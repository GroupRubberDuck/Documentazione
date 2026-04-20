#import "config/deps.typ" as deps
#let req-name="Visualizzazione nome modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del modello nella lista dei modelli.
  ],
  fonti:(
    "Visualizza nome modello da lista modelli",
    )

)