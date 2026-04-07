#import "config/deps.typ" as deps
#let req-name="Visualizzazione descrizione requisito modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione del requisito nel dettaglio del requisito del modello.
  ],
  fonti:(
    "Visualizza descrizione modello",
    )
)