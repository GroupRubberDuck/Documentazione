#import "config/deps.typ" as deps
#let req-name="Errore modifica codice requisito lunghezza non valida"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice modificato per il requisito ha una lunghezza non compresa tra 4 e 10 caratteri.
  ],
  fonti:(
    "Errore modifica codice requisito lunghezza non valida",
    )
)