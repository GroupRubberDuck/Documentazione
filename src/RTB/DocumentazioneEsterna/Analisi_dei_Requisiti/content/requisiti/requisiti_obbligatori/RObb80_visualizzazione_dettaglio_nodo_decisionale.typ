#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dettaglio nodo decisionale")
    #label(deps.slugify("Visualizzazione dettaglio nodo decisionale"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il dettaglio completo di un nodo decisionale attivo selezionandolo dal decision tree.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dettaglio nodo decisionale")
  ]
)