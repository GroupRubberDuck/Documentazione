#import "config/deps.typ" as deps
#let req-name="Visualizzazione nome requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del requisito nel dettaglio.
  ],
  fonti:(
    "Visualizza nome del requisito",

  )
)