#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Rimozione nodo dal decision tree")
    #label(deps.slugify("Rimozione nodo dal decision tree"))
    ],

  descrizione:[
  L'Utente deve poter rimuovere un nodo dal decision tree durante una sessione di modifica del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Rimuovi nodo")
  ]
)