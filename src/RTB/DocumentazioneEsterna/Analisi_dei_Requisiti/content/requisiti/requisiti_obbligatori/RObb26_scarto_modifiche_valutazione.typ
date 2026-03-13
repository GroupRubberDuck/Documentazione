#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Scarto modifiche valutazione")
    #label(deps.slugify("Scarto modifiche valutazione"))
    ],

  descrizione:[
  L'Utente deve poter scartare tutte le modifiche apportate durante la sessione di valutazione e chiudere la sessione senza salvare.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Scarta modifiche valutazione")
  ]
)