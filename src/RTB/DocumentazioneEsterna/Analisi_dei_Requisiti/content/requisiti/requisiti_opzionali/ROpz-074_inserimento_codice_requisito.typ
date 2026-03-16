#import "config/deps.typ" as deps
#let req-name="Inserimento codice requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire il codice del requisito durante la creazione di un nuovo requisito.
  ],
  fonti:(
    "Inserisci codice requisito",
    )
)