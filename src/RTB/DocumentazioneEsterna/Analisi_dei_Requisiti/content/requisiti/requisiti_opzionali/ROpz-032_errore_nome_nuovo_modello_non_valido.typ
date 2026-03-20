#import "config/deps.typ" as deps
#let req-name="Errore nome nuovo modello non valido"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il nome inserito per il nuovo modello non è compreso tra 1 e 32 caratteri.
  ],
  fonti:(
    "Errore nome nuovo modello non valido",
    )

)