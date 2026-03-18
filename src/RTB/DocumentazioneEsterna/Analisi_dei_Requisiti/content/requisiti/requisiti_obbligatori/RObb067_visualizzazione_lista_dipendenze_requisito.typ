#import "config/deps.typ" as deps
#let req-name="Visualizzazione lista dipendenze requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista delle dipendenze del requisito nel dettaglio.
  ],
  fonti:(
    "Visualizza lista dipendenze requisito",
    )
)