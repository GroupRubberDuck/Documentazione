#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione nome requisito modello in lista")
    #label(deps.slugify("Visualizzazione nome requisito modello in lista"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome del requisito nella lista dei requisiti del modello.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza nome requisito da lista requisiti modello")
  ]
)