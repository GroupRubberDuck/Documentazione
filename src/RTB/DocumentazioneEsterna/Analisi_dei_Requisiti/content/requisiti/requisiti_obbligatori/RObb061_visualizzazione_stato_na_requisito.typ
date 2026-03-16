#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato na requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato NOT APPLICABLE per la valutazione del requisito quando applicabile.
  ],
  fonti:(
    "Visualizza stato na requisito",
  )

)