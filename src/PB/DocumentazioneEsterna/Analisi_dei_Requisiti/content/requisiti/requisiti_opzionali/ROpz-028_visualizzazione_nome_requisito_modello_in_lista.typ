#import "config/deps.typ" as deps
#let req-name="Visualizzazione nome requisito modello in lista"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del requisito nella lista dei requisiti del modello.
  ],
  fonti:(
    "Visualizza nome requisito da lista requisiti modello",
    )
)