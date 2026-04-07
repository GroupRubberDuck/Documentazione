#import "config/deps.typ" as deps

#let req-name="Norme di progetto"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
      Il sistema deve essere sviluppato rispettando le convenzioni e gli standard definiti nelle Norme di Progetto.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:[
    #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v1.0.0.pdf")[Norme di Progetto v1.0.0];
  ]
)