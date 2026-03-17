#import "config/deps.typ" as deps

#let req-name="Database relazionale"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    Il sistema deve utilizzare un database di tipo relazionale, adatto a gestire le relazioni strutturate tra dispositivi, asset, requisiti e nodi dei decision tree.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:[
    #link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/VerbaliEsterni/2026-01-13_Verbale-v1.0.0.pdf")[Verbale esterno 2026-01-13 v1.0.0];
  ]
)