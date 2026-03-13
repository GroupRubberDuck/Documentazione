#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Errore modifica nome requisito non valido")
    #label(deps.slugify("Errore modifica nome requisito non valido"))
    ],

  descrizione:[

  ],
  fonti:[
    
  ]
)