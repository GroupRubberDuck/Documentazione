#import "config/deps.typ" as deps
#let req-name="Visualizzazione grafo dipendenze"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il grafo delle dipendenze del requisito quando si verifica una dipendenza circolare.

  ],
  fonti:(
    "Visualizza grafo dipendenze",
  )
)