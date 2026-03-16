#import "config/deps.typ" as deps
#let req-name="Errore modifica nome dispositivo non valido"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nuovo nome inserito per il dispositivo non è valido.
  ],
  fonti:(
    "Errore modifica nome dispositivo non valido",
    )
)