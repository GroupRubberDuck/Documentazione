#import "config/deps.typ" as deps
#let req-name="Reindirizzamento da nodo root"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un avviso ed essere reindirizzato al dettaglio del requisito se tenta di tornare indietro dal nodo root del decision tree.
  ],
  fonti:(
    "Nodo corrente root",
    )
)