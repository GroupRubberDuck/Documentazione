#import "config/deps.typ" as deps

#let req-name="Visualizzazione elemento lista asset"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare le informazioni generali di ogni asset nella lista degli asset del dispositivo.
    ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Visualizza singolo elemento lista asset",
  )
)