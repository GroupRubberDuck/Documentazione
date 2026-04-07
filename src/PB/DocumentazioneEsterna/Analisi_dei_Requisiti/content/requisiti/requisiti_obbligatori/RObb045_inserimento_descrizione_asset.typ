#import "config/deps.typ" as deps
#let req-name="Inserimento descrizione asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento descrizione asset")
    #label(deps.get-req-code(nome-etichetta:"Inserimento descrizione asset"))
    ],

  descrizione:[
  L'Utente deve poter inserire la descrizione dell'asset durante l'aggiunta.
  ],
  fonti:(
    "Inserisci descrizione asset",
  )
)