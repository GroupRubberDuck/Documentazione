#import "config/deps.typ" as deps

#let req-name="Modifica codice nodo decision tree"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare il codice di un nodo di decisione esistente nel decision tree.

  Il codice deve essere univoco e di lunghezza compresa tra 4 e 10 caratteri.

  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Modifica codice nodo decision tree",
    )
)