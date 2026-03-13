#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione codice requisito")
    #label(deps.slugify("Visualizzazione codice requisito"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito sia nella lista che nel dettaglio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza codice requisito da lista requisiti")
  #use-case-label(nome-etichetta:"Visualizza codice requisito")
  ]
)