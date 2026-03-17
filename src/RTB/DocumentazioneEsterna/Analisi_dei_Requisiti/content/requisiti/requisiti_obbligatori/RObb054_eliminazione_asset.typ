#import "config/deps.typ" as deps
#let req-name="Eliminazione asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter eliminare un asset dal dispositivo durante la sessione di valutazione, previa conferma esplicita.
  ],
  fonti:(
    "Elimina asset",
    )
)