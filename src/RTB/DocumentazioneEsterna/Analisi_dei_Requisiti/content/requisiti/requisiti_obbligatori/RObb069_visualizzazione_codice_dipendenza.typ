#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice dipendenza"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice di ogni dipendenza nella lista delle dipendenze del requisito.
  ],
  fonti:(
    "Visualizza codice dipendenza",
  )
)