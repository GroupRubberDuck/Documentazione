#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore file dispositivo non valido")
    #label(deps.slugify("Errore file dispositivo non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se il file selezionato non è leggibile o non rispetta il formato atteso.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore nella lettura del file")
  ]
)