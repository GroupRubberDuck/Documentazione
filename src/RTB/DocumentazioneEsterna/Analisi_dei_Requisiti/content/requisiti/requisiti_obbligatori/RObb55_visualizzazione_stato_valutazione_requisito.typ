#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato valutazione requisito")
    #label(deps.slugify("Visualizzazione stato valutazione requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato di valutazione del requisito sia nella lista che nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato valutazione requisito da lista requisiti")
  #use-case-label(nome-etichetta:"Visualizza stato valutazione requisito")
  ]
)