#import "config/deps.typ" as deps
#let req-name="Errore modello esistente"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il modello che si tenta di importare esiste già nel sistema.
  ],
  fonti:(
    "Errore modello esistente",
    )
)