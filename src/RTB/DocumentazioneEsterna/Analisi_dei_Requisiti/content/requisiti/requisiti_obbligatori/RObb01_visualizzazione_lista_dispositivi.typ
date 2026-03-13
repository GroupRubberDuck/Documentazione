#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione lista dispositivi")
    #label(deps.slugify("Visualizzazione lista dispositivi"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista di tutti i dispositivi registrati.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza lista dispositivi")
  ]
)