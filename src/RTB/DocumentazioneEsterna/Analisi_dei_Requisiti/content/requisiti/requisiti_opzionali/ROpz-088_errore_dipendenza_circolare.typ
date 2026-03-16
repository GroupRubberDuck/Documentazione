#import "config/deps.typ" as deps
#let req-name="Errore dipendenza circolare"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando l'aggiunta di una dipendenza causa una dipendenza circolare.

  ],
  fonti:(
    "Errore dipendenza circolare",
  )
)