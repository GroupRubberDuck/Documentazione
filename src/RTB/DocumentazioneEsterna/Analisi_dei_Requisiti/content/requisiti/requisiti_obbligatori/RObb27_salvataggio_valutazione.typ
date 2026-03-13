#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio valutazione")
    #label(deps.slugify("Salvataggio valutazione"))
    ],

  descrizione:[
  L'Utente deve poter salvare le modifiche apportate durante la sessione di valutazione sul sistema di permanenza.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Salva valutazione")
  ]
)