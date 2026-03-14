#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica codice nodo non valido")
    #label(deps.slugify("Errore modifica codice nodo non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice modificato per il nodo non è valido.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore modifica codice nodo non valido")
  ]
)