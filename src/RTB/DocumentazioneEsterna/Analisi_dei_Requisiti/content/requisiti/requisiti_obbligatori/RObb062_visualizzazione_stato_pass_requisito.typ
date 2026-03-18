#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato pass requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato PASS per la valutazione del requisito quando questa è completa e il risultato è PASS.
  ],
  fonti:(
    "Visualizza stato pass requisito",
  )

)