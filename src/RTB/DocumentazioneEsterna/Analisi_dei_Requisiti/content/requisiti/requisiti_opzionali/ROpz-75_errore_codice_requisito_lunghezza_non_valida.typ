#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore codice requisito lunghezza non valida")
    #label(deps.slugify("Errore codice requisito lunghezza non valida"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice inserito per il requisito ha una lunghezza non valida.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore codice requisito lunghezza non valida")
  ]
)