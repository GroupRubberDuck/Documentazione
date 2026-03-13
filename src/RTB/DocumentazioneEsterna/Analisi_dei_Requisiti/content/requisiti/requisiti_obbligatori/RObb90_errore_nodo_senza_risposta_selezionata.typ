#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore nodo senza risposta selezionata")
    #label(deps.slugify("Errore nodo senza risposta selezionata"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un avviso e non poter procedere al nodo successivo se non ha selezionato alcuna risposta per il nodo corrente.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Nodo senza risposta selezionata")
  ]
)