#import "config/deps.typ" as deps
#let req-name="Inserimento descrizione requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire la descrizione del requisito durante la creazione di un nuovo requisito.
  ],
  fonti:(
    "Inserisci descrizione requisito",
    )
)