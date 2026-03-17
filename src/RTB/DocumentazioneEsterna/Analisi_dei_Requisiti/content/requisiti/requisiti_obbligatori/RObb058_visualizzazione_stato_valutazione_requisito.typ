#import "config/deps.typ" as deps
#let req-name="Visualizzazione stato valutazione requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato di valutazione del requisito sia nella lista che nel dettaglio.
  ],
  fonti:(
    "Visualizza stato valutazione requisito da lista requisiti",
    "Visualizza stato valutazione requisito"    
  )
)