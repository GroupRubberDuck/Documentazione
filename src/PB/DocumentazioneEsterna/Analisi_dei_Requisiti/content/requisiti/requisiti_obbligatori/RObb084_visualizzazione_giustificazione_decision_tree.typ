#import "config/deps.typ" as deps
#let req-name="Visualizzazione giustificazione decision tree"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la giustificazione associata alle risposte inserite nel decision tree nel dettaglio del requisito.
  ],
  fonti:(
    "Visualizza giustificazione decision tree",
  )
)