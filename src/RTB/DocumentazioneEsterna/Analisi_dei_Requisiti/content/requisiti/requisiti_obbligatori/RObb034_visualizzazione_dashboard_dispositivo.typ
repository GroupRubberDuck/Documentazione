#import "config/deps.typ" as deps
#let req-name="Visualizzazione dashboard dispositivo"

#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione dashboard dispositivo")
    #label(deps.get-req-code(nome-etichetta:"Visualizzazione dashboard dispositivo"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare la dashboard riepilogativa della valutazione del dispositivo durante la sessione di valutazione.
  ],
  fonti:("Visualizza dashboard dispositivo",)
  )