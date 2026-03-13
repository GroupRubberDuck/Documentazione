#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione versione modello associato")
    #label(deps.slugify("Visualizzazione versione modello associato"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la versione del modello di standard associato al dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza versione modello associato")
  ]
)