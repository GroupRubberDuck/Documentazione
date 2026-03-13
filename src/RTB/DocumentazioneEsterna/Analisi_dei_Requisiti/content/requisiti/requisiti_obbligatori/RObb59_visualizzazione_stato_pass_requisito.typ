#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato pass requisito")
    #label(deps.slugify("Visualizzazione stato pass requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato PASS per la valutazione del requisito quando applicabile.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato pass requisito")
  ]
)