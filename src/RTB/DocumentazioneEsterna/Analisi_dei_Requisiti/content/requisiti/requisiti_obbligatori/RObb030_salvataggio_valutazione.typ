#import "config/deps.typ" as deps

#let req-name="Salvataggio valutazione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio valutazione")
    #label(deps.get-req-code(nome-etichetta:"Salvataggio valutazione"))
    ],

  descrizione:[
  L'Utente deve poter salvare le modifiche apportate durante la sessione di valutazione sul sistema di permanenza.
  ],
  fonti:(
    "Salva valutazione",
  )
)