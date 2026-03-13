#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore codice nodo non valido")
    #label(deps.slugify("Errore codice nodo non valido"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)