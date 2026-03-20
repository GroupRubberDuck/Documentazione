#import "config/deps.typ" as deps
#let req-name="Visualizzazione codice requisito modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il codice del requisito nell'anagrafica del requisito del modello.
  ],
  fonti:(
    "Visualizza codice requisito modello",
    )
)