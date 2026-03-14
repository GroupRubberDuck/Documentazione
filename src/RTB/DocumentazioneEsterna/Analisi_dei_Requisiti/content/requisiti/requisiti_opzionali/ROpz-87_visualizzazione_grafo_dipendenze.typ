#import "config/deps.typ" as deps
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: "Visualizzazione grafo dipendenze")
    #label(deps.slugify("Visualizzazione grafo dipendenze"))
    ],

  descrizione:[
  L'Utente deve poter visualizzare il grafo delle dipendenze del requisito quando si verifica una dipendenza circolare.
  ],
  fonti:[
  #use-case-label(nome-etichetta:"Visualizza grafo dipendenze")
  ] 
)