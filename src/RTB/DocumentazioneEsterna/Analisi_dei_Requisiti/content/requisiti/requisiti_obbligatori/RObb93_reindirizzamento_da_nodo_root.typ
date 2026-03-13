#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Reindirizzamento da nodo root")
    #label(deps.slugify("Reindirizzamento da nodo root"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un avviso ed essere reindirizzato al dettaglio del requisito se tenta di tornare indietro dal nodo root del decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Nodo corrente root")
  ]
)