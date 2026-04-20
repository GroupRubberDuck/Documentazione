#import "config/deps.typ" as deps
#let req-name="Visualizzazione nome dispositivo in lista"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta:  req-name)
    #label(deps.get-req-code(nome-etichetta: req-name))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il nome di ogni dispositivo nella lista dei dispositivi.
  ],
  fonti:(
    "Visualizza nome dispositivo su lista dispositivi",
  )

)