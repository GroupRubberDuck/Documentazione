#import "config/deps.typ" as deps

#let req-name="Visualizzazione stato aggregato dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato aggregato dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione stato aggregato dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato aggregato della valutazione del dispositivo nella dashboard.
  ],
  fonti:(
    "Visualizza stato aggregato dispositivo",
  )
)