#import "config/deps.typ" as deps
#let req-name="Inserimento codice requisito"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire un codice univoco e di lunghezza compresa tra 4 e 10 cartteri dqa associare al requisito durante la creazione di un nuovo requisito.
  ],
  fonti:(
    "Inserisci codice requisito",
    )
)