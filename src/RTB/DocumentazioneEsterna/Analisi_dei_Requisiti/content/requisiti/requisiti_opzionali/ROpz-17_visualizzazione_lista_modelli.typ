#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista modelli")
    #label(deps.slugify("Visualizzazione lista modelli"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei modelli registrati nel sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista modelli")
  ]
)