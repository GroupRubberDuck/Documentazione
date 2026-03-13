#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione modello associato al dispositivo")
    #label(deps.slugify("Visualizzazione modello associato al dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il modello di standard associato al dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza modello associato al dispositivo")
  ]
)