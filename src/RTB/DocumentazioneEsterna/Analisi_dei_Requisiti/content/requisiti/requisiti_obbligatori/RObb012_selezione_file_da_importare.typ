#import "config/deps.typ" as deps

#let req-name="Selezione file da importare"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Selezione file da importare")
    #label(deps.get-req-code(nome-etichetta:"Selezione file da importare"))
    ],

  descrizione:[
  L'Utente deve poter selezionare il file da usare in fase di importazione di un nuovo dispositivo.
  ],
  fonti:(
    "Selezione file sorgente",
  )
  
)