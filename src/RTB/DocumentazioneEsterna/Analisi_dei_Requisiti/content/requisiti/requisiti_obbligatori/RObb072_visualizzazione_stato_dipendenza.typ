#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato dipendenza"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato di valutazione di ogni dipendenza nella lista delle dipendenze del requisito.
  ],
  fonti:(
    "Visualizza stato dipendenza",
    )

)