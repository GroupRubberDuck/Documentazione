#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento nuovo dispositivo")
    #label(deps.slugify("Inserimento nuovo dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter avviare la procedura di inserimento di un nuovo dispositivo nel sistema.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Inserimento nuovo dispositivo")
  ]
)