#import "config/deps.typ" as deps

#let req-name="Documentazione su repository github"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    Tutta la documentazione di progetto (requisiti, architettura, scelte tecnologiche, metodologia) deve essere versionata e disponibile tramite una repository GitHub.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:[
    #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; 
  ]
)