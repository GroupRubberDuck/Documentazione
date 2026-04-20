#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato na requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato NA per la valutazione del requisito quando questa è completa e il risultato è NA.
  ],
  fonti:(
    "Visualizza stato na requisito",
  )

)