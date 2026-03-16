#import "config/deps.typ" as deps
#let req-name="Errore file dispositivo non valido"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore file dispositivo non valido")
    #label(deps.get-req-code(nome-etichetta:"Errore file dispositivo non valido"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se il file selezionato non è leggibile o non rispetta il formato atteso.
  ],
  fonti:(
    "Errore file dispositivo non valido",
    )
)