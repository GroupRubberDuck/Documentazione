#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Modifica asset")
    #label(deps.slugify("Modifica asset"))
    ],

  descrizione:[
  L'Utente deve poter modificare le informazioni di un asset esistente durante una sessione di valutazione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Modifica asset")
  ]
)