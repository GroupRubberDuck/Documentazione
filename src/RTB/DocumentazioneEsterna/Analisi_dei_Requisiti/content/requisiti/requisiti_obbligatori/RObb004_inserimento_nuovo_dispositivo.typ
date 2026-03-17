#import "config/deps.typ" as deps

#let req-name="Inserimento nuovo dispositivo"


#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire e registrare nuovi dispositivi nel sistema.
  ],
  fonti:(
    "Inserimento nuovo dispositivo",
  )
)