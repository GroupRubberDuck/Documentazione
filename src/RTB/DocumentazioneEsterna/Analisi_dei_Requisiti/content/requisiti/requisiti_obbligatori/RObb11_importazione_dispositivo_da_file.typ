#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Importazione dispositivo da file")
    #label(deps.slugify("Importazione dispositivo da file"))
    ],

  descrizione:[
  L'Utente deve poter inserire un nuovo dispositivo importando i dati da un file esterno.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Importa dispositivo")
  ]
)