#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modello giã  esistente")
    #label(deps.slugify("Errore modello giã  esistente"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il modello che si tenta di importare esiste già nel sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore modello esistente")
  ]
)