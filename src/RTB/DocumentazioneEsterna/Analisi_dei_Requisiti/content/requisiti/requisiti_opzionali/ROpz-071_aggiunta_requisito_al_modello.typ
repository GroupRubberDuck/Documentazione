#import "config/deps.typ" as deps
#let req-name="Aggiunta requisito al modello"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nuovo requisito al modello durante una sessione di modifica.
  ],
  fonti:(
    "Aggiungi requisito",
    )
)