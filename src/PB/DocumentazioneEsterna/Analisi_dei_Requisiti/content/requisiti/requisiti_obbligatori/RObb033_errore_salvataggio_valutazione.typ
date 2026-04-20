#import "config/deps.typ" as deps


#let req-name="Errore salvataggio valutazione"


#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore salvataggio valutazione")
    #label(deps.get-req-code(nome-etichetta:"Errore salvataggio valutazione"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se il salvataggio della valutazione non va a buon fine a causa di un errore imprevisto, mantenendo attiva la sessione.
  ],
  fonti:(

    "Errore salvataggio valutazione",
  )
)