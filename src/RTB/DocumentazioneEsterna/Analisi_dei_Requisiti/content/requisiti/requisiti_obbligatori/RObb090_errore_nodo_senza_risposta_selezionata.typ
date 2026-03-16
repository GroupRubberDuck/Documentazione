#import "config/deps.typ" as deps
#let req-name="Errore nodo senza risposta selezionata"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare un avviso e non poter procedere al nodo successivo se non ha selezionato alcuna risposta per il nodo corrente.
  ],
  fonti:(
    "Nodo senza risposta selezionata",
    )
)