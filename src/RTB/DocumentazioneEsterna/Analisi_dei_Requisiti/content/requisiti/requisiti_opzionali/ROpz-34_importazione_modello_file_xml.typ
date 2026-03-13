#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Importazione modello file xml")
    #label(deps.slugify("Importazione modello file xml"))
    ],

  descrizione:[
  L'Utente deve poter importare un modello da un file in formato XML.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Importa modello file XML")
  ]
)