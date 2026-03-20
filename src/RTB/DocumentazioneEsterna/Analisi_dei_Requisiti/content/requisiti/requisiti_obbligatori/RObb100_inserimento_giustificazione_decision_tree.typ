#import "config/deps.typ" as deps
#let req-name="Inserimento giustificazione decision tree"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire o modificare il testo della giustificazione associata alla valutazione del requisito durante la sessione di valutazione.
  ],
  fonti:(
    "Inserisci giustificazione decision tree",
    )
)