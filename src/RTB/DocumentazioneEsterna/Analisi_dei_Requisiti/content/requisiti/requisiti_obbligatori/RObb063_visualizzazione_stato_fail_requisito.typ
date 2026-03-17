#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato fail requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato FAIL per la valutazione del requisito quando questa è completa e il risultato è FAIL.
  ],
  fonti:(
    "Visualizza stato fail requisito",
)
)