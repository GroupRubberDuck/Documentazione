#import "config/deps.typ" as deps

#let req-name="Valuta asset"
========

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    L'utente deve poter valutare i singoli asset di cui si compone il dispositivo.
  ],
  
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "valuta asset",
  )

)