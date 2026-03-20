#import "config/deps.typ" as deps
#let req-name="Errore struttura modello non valida"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando la struttura del modello non è valida al momento del salvataggio.

  Esiste almeno un decision tree il cui scheletro non è completo.
  
  ],
  fonti:(
    "Errore struttura non valida per il salvataggio",
    )
)