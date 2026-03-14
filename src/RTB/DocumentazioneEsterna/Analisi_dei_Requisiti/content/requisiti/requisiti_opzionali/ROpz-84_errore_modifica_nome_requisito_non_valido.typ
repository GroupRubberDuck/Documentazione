#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica nome requisito non valido")
    #label(deps.slugify("Errore modifica nome requisito non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nuovo nome inserito per il requisito non è valido.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore modifica nome requisito non valido")
  ]
)