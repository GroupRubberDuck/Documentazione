#import "config/deps.typ" as deps

#let req-name="Inserimento sistema operativo dispositivo"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Inserimento sistema operativo dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Inserimento sistema operativo dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter inserire il sistema operativo del dispositivo durante la creazione manuale.
  ],
  fonti:(
  "Inserimento sistema operativo dispositivo",
)
)


