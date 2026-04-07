#import "config/deps.typ" as deps
#let req-name="Inserimento nome requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire un nome di lunghezza compresa tra 1 e 64 caratteri da associare al requisito durante la creazione di un nuovo requisito.
  ],
  fonti:(
    "Inserisci nome requisito",
    )
)