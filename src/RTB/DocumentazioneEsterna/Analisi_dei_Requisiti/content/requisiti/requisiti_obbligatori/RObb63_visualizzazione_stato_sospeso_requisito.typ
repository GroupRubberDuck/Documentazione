#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato sospeso requisito")
    #label(deps.slugify("Visualizzazione stato sospeso requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato Sospeso per la valutazione del requisito quando applicabile.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato sospeso requisito")
  ]
)