#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore dipendenza circolare")
    #label(deps.slugify("Errore dipendenza circolare"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando l'aggiunta di una dipendenza causa una dipendenza circolare.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore dipendenza circolare")
  ]
)