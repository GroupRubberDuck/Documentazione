#import "config/deps.typ" as deps
#let req-name="Annullamento inserimento dispositivo"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Annullamento inserimento dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Annullamento inserimento dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter annullare la procedura di inserimento di un nuovo dispositivo in qualsiasi momento.
  ],
  fonti:(
    
  "Annullamento inserimento dispositivo",
  )

)