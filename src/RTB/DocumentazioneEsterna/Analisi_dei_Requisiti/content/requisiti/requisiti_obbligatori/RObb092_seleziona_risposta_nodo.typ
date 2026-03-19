#import "config/deps.typ" as deps

#let req-name="Seleziona risposta nodo"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter selezionare una risposta per il nodo di decisione corrente.
  ],

  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Inserisci risposta nodo decision tree",
  )
)