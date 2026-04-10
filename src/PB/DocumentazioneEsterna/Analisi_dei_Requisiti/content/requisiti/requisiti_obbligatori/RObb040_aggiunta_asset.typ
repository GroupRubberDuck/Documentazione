#import "config/deps.typ" as deps

#let req-name="Aggiunta asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta asset")
    #label(deps.get-req-code(nome-etichetta:"Aggiunta asset"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nuovo asset al dispositivo durante la sessione di valutazione.
  ],
  fonti:(
    "Aggiunta asset",
  )

)