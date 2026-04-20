#import "config/deps.typ" as deps
#let req-name="Visualizzazione sintesi dipendenza"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni sintetiche di ogni dipendenza nella lista delle dipendenze del requisito.
  ],
  fonti:(
    "Visualizza sintesi dipendenza",
    )
)