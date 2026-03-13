#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore codice nodo giã  esistente")
    #label(deps.slugify("Errore codice nodo giã  esistente"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)