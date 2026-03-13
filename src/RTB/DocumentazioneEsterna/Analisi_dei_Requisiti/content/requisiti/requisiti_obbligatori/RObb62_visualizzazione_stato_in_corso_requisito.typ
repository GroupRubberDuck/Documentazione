#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato in corso requisito")
    #label(deps.slugify("Visualizzazione stato in corso requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato In corso per la valutazione del requisito quando la compilazione del decision tree non è ancora completata.
  ],
  fonti:[
    #use-case-label(nome-etichetta:"Visualizza stato in corso requisito")
  ]
)