#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione giustificazione decision tree")
    #label(deps.slugify("Visualizzazione giustificazione decision tree"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la giustificazione associata alle risposte inserite nel decision tree nel dettaglio del requisito.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza giustificazione decision tree")
  ]
)