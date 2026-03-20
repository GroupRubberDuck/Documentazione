#import "config/deps.typ" as deps
#let req-name="Errore file dispositivo non valido metadati"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se il file selezionato ha una dimensione pari a 0 byte o superiore a 10 MB.
  ],
  fonti:(
    "Errore file dispositivo non valido",
    )
)