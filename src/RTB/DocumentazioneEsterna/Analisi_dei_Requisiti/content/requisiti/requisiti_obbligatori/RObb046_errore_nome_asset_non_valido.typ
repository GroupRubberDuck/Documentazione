#import "config/deps.typ" as deps
#let req-name="Errore nome asset non valido"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nome asset non valido")
    #label(deps.get-req-code(nome-etichetta:"Errore nome asset non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore se inserisce un nome per l'asset di lunghezza non compresa tra 1 e 32 caratteri .
  ],
  fonti:("Errore nome asset non valido",)
)