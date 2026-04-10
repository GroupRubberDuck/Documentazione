#import "config/deps.typ" as deps

#let req-name="Salvataggio e continuazione sessione di valutazione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Salvataggio e continuazione sessione di valutazione")
    #label(deps.get-req-code(nome-etichetta:"Salvataggio e continuazione sessione di valutazione"))
    ],

  descrizione:[
  L'Utente deve poter salvare le modifiche apportate durante la valutazione mantenendo la sessione aperta per continuare.
  ],
  fonti:(
    "Salva e continua valutazione dispositivo",
  )

)