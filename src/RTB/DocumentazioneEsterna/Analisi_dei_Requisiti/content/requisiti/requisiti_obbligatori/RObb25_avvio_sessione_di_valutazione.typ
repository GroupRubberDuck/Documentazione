#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Avvio sessione di valutazione")
    #label(deps.slugify("Avvio sessione di valutazione"))
    ],

  descrizione:[
  L'Utente deve poter avviare la sessione di valutazione di un dispositivo registrato nel sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Avvia valutazione dispositivo")
  ]
)