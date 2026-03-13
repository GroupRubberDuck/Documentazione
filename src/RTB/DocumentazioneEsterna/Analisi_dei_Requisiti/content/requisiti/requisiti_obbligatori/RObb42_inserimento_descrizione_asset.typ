#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento descrizione asset")
    #label(deps.slugify("Inserimento descrizione asset"))
    ],

  descrizione:[
  L'Utente deve poter inserire la descrizione dell'asset durante l'aggiunta.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci descrizione asset")
  ]
)