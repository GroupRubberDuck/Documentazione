#import "config/deps.typ" as deps
#let req-name="Eliminazione dispositivo"


#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Eliminazione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo dal sistema.
  ],
  fonti:(
    "Elimina dispositivo",
    )

)