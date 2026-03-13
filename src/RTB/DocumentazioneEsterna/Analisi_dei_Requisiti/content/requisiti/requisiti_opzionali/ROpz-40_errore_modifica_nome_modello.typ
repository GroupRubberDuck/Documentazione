#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica nome modello")
    #label(deps.slugify("Errore modifica nome modello"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nuovo nome inserito per il modello non è valido.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore modifica nome modello")
  ]
)