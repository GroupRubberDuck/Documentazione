#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato fail requisito")
    #label(deps.slugify("Visualizzazione stato fail requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato FAIL per la valutazione del requisito quando applicabile.
  ],
  fonti:[
    #use-case-label(nome-etichetta:"Visualizza stato fail requisito")
  ]
)