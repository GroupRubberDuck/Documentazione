#import "config/deps.typ" as deps

#let req-name="Scarto modifiche valutazione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Scarto modifiche valutazione")
    #label(deps.get-req-code(nome-etichetta:"Scarto modifiche valutazione"))
    ],

  descrizione:[
  L'Utente deve poter scartare tutte le modifiche apportate dall'ultimo salvataggio effettuato e chiudere la sessione senza salvare.
  ],
  fonti:(
    "Scarta modifiche valutazione",
    )
)