#import "config/deps.typ" as deps

#let req-name="Annullamento aggiunta asset"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento aggiunta asset")
    #label(deps.get-req-code(nome-etichetta:"Annullamento aggiunta asset"))
    ],

  descrizione:[
  L'Utente deve poter annullare la procedura di aggiunta di un nuovo asset in qualsiasi momento.
  ],
  fonti:(

    "Annulla aggiunta asset",
    )
)