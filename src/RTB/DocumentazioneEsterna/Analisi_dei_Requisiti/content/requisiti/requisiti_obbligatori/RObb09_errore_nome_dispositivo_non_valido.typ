#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome dispositivo non valido")
    #label(deps.slugify("Errore nome dispositivo non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se inserisce un nome non valido per il dispositivo.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore nome dispositivo non valido")
  ]
)