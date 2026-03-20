#import "config/deps.typ" as deps

#let req-name="Creazione manuale dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter creare un nuovo dispositivo inserendo manualmente i dati richiesti.
  ],
  fonti:(
    "Crea nuovo dispositivo",
    )
  

)