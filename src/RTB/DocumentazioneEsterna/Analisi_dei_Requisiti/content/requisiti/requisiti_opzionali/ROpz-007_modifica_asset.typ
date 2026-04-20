#import "config/deps.typ" as deps
#let req-name="Modifica asset"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare le informazioni di un asset esistente durante una sessione di valutazione.
  ],
  fonti:(
    "Modifica asset",
    )
)