#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Aggiunta requisito al modello")
    #label(deps.slugify("Aggiunta requisito al modello"))
    ],

  descrizione:[
  L'Utente deve poter aggiungere un nuovo requisito al modello durante una sessione di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Aggiungi requisito")
  ]
)