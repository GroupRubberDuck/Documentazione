#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore salvataggio valutazione")
    #label(deps.slugify("Errore salvataggio valutazione"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se il salvataggio della valutazione non va a buon fine, mantenendo attiva la sessione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore salvataggio valutazione")
  ]
)