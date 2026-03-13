#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Importazione modello da file")
    #label(deps.slugify("Importazione modello da file"))
    ],

  descrizione:[
  L'Utente deve poter importare un nuovo modello da file.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Importa nuovo modello")
  ]
)