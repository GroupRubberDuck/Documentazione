#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica domanda vuota")
    #label(deps.slugify("Errore modifica domanda vuota"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando la domanda modificata per il nodo è vuota.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore modifica domanda vuota")
  ]
)