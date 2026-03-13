#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nome asset")
    #label(deps.slugify("Inserimento nome asset"))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome dell'asset durante l'aggiunta.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci nome asset")
  ]
)