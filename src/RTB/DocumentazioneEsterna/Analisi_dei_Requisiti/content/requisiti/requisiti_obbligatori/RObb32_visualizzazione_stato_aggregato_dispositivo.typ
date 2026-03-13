#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione stato aggregato dispositivo")
    #label(deps.slugify("Visualizzazione stato aggregato dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare lo stato aggregato della valutazione del dispositivo nella dashboard.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza stato aggregato dispositivo")
  ]
)