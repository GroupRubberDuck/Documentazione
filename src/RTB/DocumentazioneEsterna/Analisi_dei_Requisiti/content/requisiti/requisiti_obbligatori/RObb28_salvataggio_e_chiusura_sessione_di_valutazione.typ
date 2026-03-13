#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio e chiusura sessione di valutazione")
    #label(deps.slugify("Salvataggio e chiusura sessione di valutazione"))
    ],

  descrizione:[
  L'Utente deve poter salvare le modifiche apportate durante la valutazione e chiudere la sessione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Salva e chiudi valutazione dispositivo")
  ]
)