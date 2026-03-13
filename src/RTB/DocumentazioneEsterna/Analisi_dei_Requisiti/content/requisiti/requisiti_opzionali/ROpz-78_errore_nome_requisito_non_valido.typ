#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome requisito non valido")
    #label(deps.slugify("Errore nome requisito non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nome inserito per il requisito non è valido.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore nome requisito non valido")
  ]

)