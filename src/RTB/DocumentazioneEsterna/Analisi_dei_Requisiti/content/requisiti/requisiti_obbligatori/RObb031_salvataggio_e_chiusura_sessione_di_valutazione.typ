#import "config/deps.typ" as deps

#let req-name="Salvataggio e chiusura sessione di valutazione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio e chiusura sessione di valutazione")
    #label(deps.get-req-code(nome-etichetta:"Salvataggio e chiusura sessione di valutazione"))
    ],

  descrizione:[
  L'Utente deve poter salvare le modifiche apportate durante la valutazione e chiudere la sessione.
  ],
  fonti:(
  "Salva e chiudi valutazione dispositivo",
  )
  
)