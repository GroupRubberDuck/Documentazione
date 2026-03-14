#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore eliminazione nodo root")
    #label(deps.slugify("Errore eliminazione nodo root"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando tenta di eliminare il nodo root del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore nodo root")
  ]
)