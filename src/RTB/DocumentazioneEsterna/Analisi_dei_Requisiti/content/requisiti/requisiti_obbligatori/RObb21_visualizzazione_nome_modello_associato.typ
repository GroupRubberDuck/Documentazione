#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome modello associato")
    #label(deps.slugify("Visualizzazione nome modello associato"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del modello di standard associato al dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome modello associato")
  ]
)