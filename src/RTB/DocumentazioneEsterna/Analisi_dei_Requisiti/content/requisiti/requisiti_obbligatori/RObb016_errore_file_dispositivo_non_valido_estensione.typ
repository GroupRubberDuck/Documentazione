#import "config/deps.typ" as deps
#let req-name="Errore file dispositivo non valido estensione"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo se il file selezionato non rientra tra i formati supportati.
  ],
  fonti:(
    "Errore file dispositivo non valido",
    )
)