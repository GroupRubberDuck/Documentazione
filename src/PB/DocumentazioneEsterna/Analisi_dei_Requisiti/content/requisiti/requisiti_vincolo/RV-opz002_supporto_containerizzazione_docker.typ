#import "config/deps.typ" as deps

#let req-name="Supporto containerizzazione Docker"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    L'applicazione deve supportare la containerizzazione tramite Docker. Questo facilita la distribuzione, l'isolamento dell'ambiente e la compatibilità multipiattaforma.
  ],
  
  fonti:[
    Interno
  ]
)
