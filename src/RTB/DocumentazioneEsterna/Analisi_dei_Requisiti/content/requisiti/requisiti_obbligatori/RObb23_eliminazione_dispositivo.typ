#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione dispositivo")
    #label(deps.slugify("Eliminazione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un dispositivo dal sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina dispositivo")
  ] 

)