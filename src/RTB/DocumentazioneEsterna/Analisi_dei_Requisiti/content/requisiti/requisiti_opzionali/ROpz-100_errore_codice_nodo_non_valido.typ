#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore codice nodo non valido")
    #label(deps.slugify("Errore codice nodo non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice inserito per il nodo non è valido.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore codice nodo non valido")
  ]
)