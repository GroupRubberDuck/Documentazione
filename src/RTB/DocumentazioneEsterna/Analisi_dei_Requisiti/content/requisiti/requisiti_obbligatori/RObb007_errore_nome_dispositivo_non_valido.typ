#import "config/deps.typ" as deps
#let req-name="Errore nome dispositivo non valido"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome dispositivo non valido")
    #label(deps.get-req-code(nome-etichetta:"Errore nome dispositivo non valido"))
    ],

  descrizione:[
    L'utente deve poter visualizzare un messaggio di errore se in fase di creazione di un dispositivo inserisce un nome di lunghezza non compresa tra 1 e 64 caratteri.
  ],
  fonti:("Errore nome dispositivo non valido",)
)