#import "config/deps.typ" as deps
#let req-name="Errore nome dispositivo non valido"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome dispositivo non valido")
    #label(deps.get-req-code(nome-etichetta:"Errore nome dispositivo non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se inserisce un nome non valido per il dispositivo.
  ],
  fonti:("Errore nome dispositivo non valido",)
)