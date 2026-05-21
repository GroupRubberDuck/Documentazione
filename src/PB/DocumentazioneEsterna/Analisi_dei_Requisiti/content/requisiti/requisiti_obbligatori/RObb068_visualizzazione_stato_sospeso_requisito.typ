#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato sospeso requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],
  descrizione:[
  L'utente deve poter visualizzare lo stato in corso per la valutazione del requisito Quando la valutazione di una dipendenza è fallita o non è stata completata risolta.
  ],
  fonti:(
    "Visualizza stato in corso requisito",
    )
)