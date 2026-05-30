#import "config/deps.typ" as deps
// in realtà visualizza lo stato not applicable, stiamo usando questo perché abbiamo cambiato il requisito ma non ho voglia di sistemare il mapping
#let req-name="Visualizzazione stato sospeso requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],
  descrizione:[
  L'Utente deve poter visualizzare lo stato NA per la valutazione del requisito quando un altro requisito, da cui il requisito corrente dipende, è stato valutato NA.
  ],
  fonti:(
    "Visualizza stato NA requisito",
    )
)