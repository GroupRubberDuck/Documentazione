#import "config/deps.typ" as deps
#let req-name="Visualizzazione descrizione normativa requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione normativa del requisito nel dettaglio.
  ],
  fonti:(
    "Visualizza descrizione normativa",
  )

)