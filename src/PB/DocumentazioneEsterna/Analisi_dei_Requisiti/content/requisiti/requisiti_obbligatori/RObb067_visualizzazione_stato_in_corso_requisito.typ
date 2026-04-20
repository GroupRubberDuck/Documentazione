#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato in corso requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato In corso per la valutazione del requisito quando la compilazione del decision tree non è ancora completata.
  ],
  fonti:(
    "Visualizza stato in corso requisito",
    )
)