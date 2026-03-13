#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione descrizione dispositivo")
    #label(deps.slugify("Visualizzazione descrizione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la descrizione del dispositivo nella vista dati e nella dashboard.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza descrizione dispositivo")
  #use-case-label(nome-etichetta:"Visualizza descrizione dispositivo su dashboard")
  ] 
)