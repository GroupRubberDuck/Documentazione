#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato sospeso requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],
  descrizione:[
  L'Utente deve poter visualizzare lo stato Sospeso per la valutazione del requisito quando un altro requisito, da cui il requisito corrente dipende, è stato valutato NA.
  ],
  fonti:(
    "Visualizza stato sospeso requisito",
    )
)