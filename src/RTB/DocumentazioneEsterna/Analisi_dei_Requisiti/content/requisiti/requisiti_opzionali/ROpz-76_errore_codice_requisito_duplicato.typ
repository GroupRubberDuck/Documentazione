#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore codice requisito duplicato")
    #label(deps.slugify("Errore codice requisito duplicato"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice inserito per il requisito è già associato a un altro requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore codice requisito duplicato")
  ]
)