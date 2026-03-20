#import "config/deps.typ" as deps
#let req-name="Salvataggio modifiche modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter salvare in le modifiche apportate alla struttura del modello.

    La struttura non è valida al momento del salvataggio se vi è almeno uno scheletro di decision tree con almeno un percorso che non termina in un nodo foglia.
  ],
  fonti:(
    "Salva modifica modello",
  )
)