#import "config/deps.typ" as deps

#let req-name="Metriche di qualita"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    Il sistema deve seguire le metriche di qualità indicate nel Piano di Qualifica. Ogni requisito obbligatorio deve essere coperto da almeno un test che ne verifichi il corretto funzionamento.
  ],
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:[
    #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; 
    #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica-v1.0.0.pdf")[Piano di Qualifica v1.0.0];
  ]
)
