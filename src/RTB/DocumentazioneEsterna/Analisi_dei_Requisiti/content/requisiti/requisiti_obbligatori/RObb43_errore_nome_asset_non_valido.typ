#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome asset non valido")
    #label(deps.slugify("Errore nome asset non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore se inserisce un nome non valido per l'asset.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Errore nome asset non valido")
  ]
)