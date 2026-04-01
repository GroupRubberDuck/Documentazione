#import "config/deps.typ" as deps

#let req-name="Rimozione nodo dal decision tree"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter rimuovere un nodo dal decision tree durante una sessione di modifica del modello.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:(
    "Rimuovi nodo",
    )
)