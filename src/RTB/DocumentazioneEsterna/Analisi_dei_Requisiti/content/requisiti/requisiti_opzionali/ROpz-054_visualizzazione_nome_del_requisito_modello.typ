#import "config/deps.typ" as deps
#let req-name="Visualizzazione nome del requisito modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del requisito nell'anagrafica del requisito del modello.
  ],
  fonti:(
    "Visualizza nome del requisito modello",
    )

)