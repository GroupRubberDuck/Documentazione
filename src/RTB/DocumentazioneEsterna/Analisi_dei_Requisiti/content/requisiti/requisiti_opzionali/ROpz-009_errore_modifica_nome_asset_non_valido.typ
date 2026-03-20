#import "config/deps.typ" as deps
#let req-name="Errore modifica nome asset non valido"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nuovo nome inserito per l'asset non è di lunghezza compresa tra 1 e 32 caratteri.
  ],
  fonti:(
    "Errore modifica nome asset non valido",
    )
)