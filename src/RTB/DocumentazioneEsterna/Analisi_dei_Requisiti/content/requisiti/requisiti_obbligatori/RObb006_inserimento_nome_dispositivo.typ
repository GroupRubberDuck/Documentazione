#import "config/deps.typ" as deps
  #let req-name="Inserimento nome dispositivo"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
  L'Utente deve poter inserire il nome del dispositivo durante la creazione manuale.

  La lunghezza del nome deve essere compresa tra 1 e 64 caratteri.
  ],
  fonti:(
    "Inserimento nome dispositivo",
    )
)