#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio e continuazione sessione di valutazione")
    #label(deps.slugify("Salvataggio e continuazione sessione di valutazione"))
    ],

  descrizione:[
  L'Utente deve poter salvare le modifiche apportate durante la valutazione mantenendo la sessione aperta per continuare.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Salva e continua valutazione dispositivo")
  ]

)