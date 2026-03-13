#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome nuovo modello non valido")
    #label(deps.slugify("Errore nome nuovo modello non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nome inserito per il nuovo modello non è valido.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore nome nuovo modello non valido")
  ]

)