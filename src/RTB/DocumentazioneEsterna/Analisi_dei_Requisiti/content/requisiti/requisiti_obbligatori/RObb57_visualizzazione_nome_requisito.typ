#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome requisito")
    #label(deps.slugify("Visualizzazione nome requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del requisito nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome del requisito")
  ]
)