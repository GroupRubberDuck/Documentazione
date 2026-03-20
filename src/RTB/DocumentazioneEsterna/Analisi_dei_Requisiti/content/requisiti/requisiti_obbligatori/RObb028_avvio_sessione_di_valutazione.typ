#import "config/deps.typ" as deps

#let req-name="Avvio sessione di valutazione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Avvio sessione di valutazione")
    #label(deps.get-req-code(nome-etichetta:"Avvio sessione di valutazione"))
    ],

  descrizione:[
  L'Utente deve poter avviare la sessione di valutazione di un dispositivo registrato nel sistema.
  ],
  fonti:(
    "Avvia valutazione dispositivo",
  )
)