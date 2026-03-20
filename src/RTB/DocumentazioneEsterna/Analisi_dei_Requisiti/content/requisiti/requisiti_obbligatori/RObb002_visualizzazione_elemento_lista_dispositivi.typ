#import "config/deps.typ" as deps

#let req-name="Visualizzazione elemento lista dispositivi"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali dei dispositivi dalla lista di tutti i dispositivi registrati.

  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Visualizza elemento lista dispositivi",
  )
)