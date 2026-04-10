#import "config/deps.typ" as deps

#let req-name="Metodologia agile"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta: req-name))
  ],

  descrizione:[
    Il progetto deve adottare un approccio Agile per la gestione e l'organizzazione del lavoro, garantendo iterazioni regolari, feedback continuo del cliente, e adattabilità ai cambiamenti dei requisiti.
  ],


  fonti:[
     #link("https://www.iso.org/standard/82075.html")[ISO/IEC/IEEE 24748-1:2023 - Processes and methodology]
  ]
)