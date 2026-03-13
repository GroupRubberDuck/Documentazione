#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento giustificazione decision tree")
    #label(deps.slugify("Inserimento giustificazione decision tree"))
    ],

  descrizione:[
  L'Utente deve poter inserire o modificare il testo della giustificazione associata alla valutazione del requisito durante la sessione di valutazione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserisci giustificazione decision tree")
  ]
)