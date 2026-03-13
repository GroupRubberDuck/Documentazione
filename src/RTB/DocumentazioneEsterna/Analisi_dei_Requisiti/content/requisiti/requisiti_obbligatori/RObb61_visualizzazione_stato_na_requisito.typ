#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato na requisito")
    #label(deps.slugify("Visualizzazione stato na requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato NOT APPLICABLE per la valutazione del requisito quando applicabile.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato na requisito")
  ]

)