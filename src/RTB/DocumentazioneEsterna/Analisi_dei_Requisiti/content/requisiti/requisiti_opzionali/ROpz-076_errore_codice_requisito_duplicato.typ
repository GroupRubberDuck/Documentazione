#import "config/deps.typ" as deps
#let req-name="Errore codice requisito duplicato"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un messaggio di errore esplicativo quando il codice inserito per il requisito è già associato a un altro requisito.
  ],
  fonti:(
    "Errore codice requisito duplicato",
    )
)