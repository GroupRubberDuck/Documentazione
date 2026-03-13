#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Eliminazione asset")
    #label(deps.slugify("Eliminazione asset"))
    ],

  descrizione:[
  L'Utente deve poter eliminare un asset dal dispositivo durante la sessione di valutazione, previa conferma esplicita.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Elimina asset")
  ]
)