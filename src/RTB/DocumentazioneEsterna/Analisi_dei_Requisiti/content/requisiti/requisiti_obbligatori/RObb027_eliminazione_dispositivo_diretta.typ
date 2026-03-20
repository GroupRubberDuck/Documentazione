#import "config/deps.typ" as deps

#let req-name="Eliminazione dispositivo diretta"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo diretta")
    #label(deps.get-req-code(nome-etichetta:"Eliminazione dispositivo diretta"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo senza effettuare un backup preventivo, previa conferma esplicita.
  ],
  fonti:(

    "Elimina dispositivo direttamente",
  )
)