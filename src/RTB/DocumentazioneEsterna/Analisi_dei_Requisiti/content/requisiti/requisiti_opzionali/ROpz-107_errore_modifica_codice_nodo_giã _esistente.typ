#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica codice nodo giã  esistente")
    #label(deps.slugify("Errore modifica codice nodo giã  esistente"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice modificato per il nodo è già associato a un altro nodo del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore modifica codice nodo già esistente")
  ]
)