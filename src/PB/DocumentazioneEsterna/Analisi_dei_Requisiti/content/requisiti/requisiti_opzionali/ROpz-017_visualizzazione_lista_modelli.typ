#import "config/deps.typ" as deps
#let req-name="Visualizzazione lista modelli"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista dei modelli registrati nel sistema.
  ],
  fonti:(
    "Visualizza lista modelli",
    )
)