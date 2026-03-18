#import "config/deps.typ" as deps

#let req-name="Importazione dispositivo da file"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Importazione dispositivo da file")
    #label(deps.get-req-code(nome-etichetta:"Importazione dispositivo da file"))
    ],

  descrizione:[
  L'Utente deve poter inserire un nuovo dispositivo importando i dati tramite l'importazione di un file esterno.
  ],
  fonti:(
    "Importa dispositivo",
  )
  
)