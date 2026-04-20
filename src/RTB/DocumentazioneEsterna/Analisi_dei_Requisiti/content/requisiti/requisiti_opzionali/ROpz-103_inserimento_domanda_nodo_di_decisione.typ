#import "config/deps.typ" as deps

#let req-name="Inserimento domanda nodo di decisione"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire la domanda associata al nodo durante l'aggiunta di un nodo di decisione al decision tree.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Inserisci domanda nodo decision tree",
    )
)