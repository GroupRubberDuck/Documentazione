#import "config/deps.typ" as deps

#let req-name="Inserimento descrizione dispositivo"


#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento descrizione dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Inserimento descrizione dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter inserire la descrizione del dispositivo durante la creazione manuale.
  ],
  fonti:(
  "Inserimento descrizione dispositivo",
)
)