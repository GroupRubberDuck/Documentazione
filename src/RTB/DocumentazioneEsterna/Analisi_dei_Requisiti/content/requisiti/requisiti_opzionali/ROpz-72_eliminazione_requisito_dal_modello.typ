#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione requisito dal modello")
    #label(deps.slugify("Eliminazione requisito dal modello"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un requisito dal modello durante una sessione di modifica.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina requisito")
  ]
)