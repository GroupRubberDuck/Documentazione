#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore struttura modello non valida")
    #label(deps.slugify("Errore struttura modello non valida"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando la struttura del modello non è valida al momento del salvataggio.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore struttura non valida per il salvataggio")
  ]
)