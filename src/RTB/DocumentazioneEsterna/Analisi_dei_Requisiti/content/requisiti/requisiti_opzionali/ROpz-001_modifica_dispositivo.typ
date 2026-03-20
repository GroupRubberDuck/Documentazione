#import "config/deps.typ" as deps
#let req-name="Modifica dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta: req-name))
    ],

  descrizione:[
  L'Utente deve poter modificare le informazioni di un dispositivo esistente.
  ],
  fonti:("Modifica dispositivo",)
)