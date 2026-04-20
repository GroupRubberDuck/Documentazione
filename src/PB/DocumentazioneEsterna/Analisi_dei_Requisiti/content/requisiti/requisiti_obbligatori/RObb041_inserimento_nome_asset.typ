#import "config/deps.typ" as deps

#let req-name="Inserimento nome asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nome asset")
    #label(deps.get-req-code(nome-etichetta:"Inserimento nome asset"))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome dell'asset durante l'aggiunta.
  Il nome dell'asset deve essere compreso tra 1 e 32 caratteri.
  ],
  fonti:(

    "Inserisci nome asset",
  )

)