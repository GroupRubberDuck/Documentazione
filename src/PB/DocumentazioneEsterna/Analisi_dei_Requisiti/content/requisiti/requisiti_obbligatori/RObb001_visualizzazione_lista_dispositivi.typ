#import "config/deps.typ" as deps
#let req-name="Visualizzazione lista dispositivi"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta:req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la lista di tutti i dispositivi registrati.
  ],
  fonti:("Visualizza lista dispositivi",)
)