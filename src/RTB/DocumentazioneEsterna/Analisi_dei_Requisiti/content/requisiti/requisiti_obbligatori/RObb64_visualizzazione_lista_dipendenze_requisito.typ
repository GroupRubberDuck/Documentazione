#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista dipendenze requisito")
    #label(deps.slugify("Visualizzazione lista dipendenze requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista delle dipendenze del requisito nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista dipendenze requisito")
  ]
)