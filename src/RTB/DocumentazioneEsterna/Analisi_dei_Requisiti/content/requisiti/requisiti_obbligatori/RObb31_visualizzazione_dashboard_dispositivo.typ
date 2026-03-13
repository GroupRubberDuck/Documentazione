#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dashboard dispositivo")
    #label(deps.slugify("Visualizzazione dashboard dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la dashboard riepilogativa della valutazione del dispositivo durante la sessione di valutazione.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza dashboard dispositivo")
  ]
)