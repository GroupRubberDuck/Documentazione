#import "/src/config.typ": template_dir
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Dati (aggiornati fino allo Sprint 14)
#let data-co = (
  ("S3", 67.0), ("S4", 55.0), ("S5", 9.0), ("S6", 9.0), ("S7", 3.0),
  ("S8", 2.0), ("S9", 2.0), ("S10", 1.0), ("S11", 1.0), ("S12", 1.0), 
  ("S13", 0.0), ("S14", 0.0)
)
#let x-labels = data-co.map(row => row.at(0))
#let values-co = data-co.map(row => row.at(1))
#let threshold = data-co.map(row => 0.0) 

#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      Errori: values-co,
      Target: threshold,
      series-names: ("Errori", "Target"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 20%,
      x-tick-angle: -45deg,
    ),
    "Andamento Correttezza Ortografica",
    y-label: "Numero Errori",
    x-label: "Sprint",
    y-min: 0,
    y-max: 70, 
    series-colors: (rgb("#e8541a"), rgb(180, 180, 180)),
    series-thickness: (2pt, 0.8pt),
  )
]

Il grafico illustra la riduzione del numero di errori ortografici e grammaticali riscontrati nella documentazione nel corso del progetto. La criticità emersa nello Sprint 3 ha spinto il gruppo a implementare processi di revisione incrociata più rigorosi e l'adozione di strumenti di correzione automatica del testo. L'adozione di tali pratiche ha prodotto un miglioramento drastico e immediato tra lo Sprint 4 e lo Sprint 5. Dallo Sprint 7 in poi, il numero di errori si è stabilizzato su valori prossimi allo zero, confermando l'efficacia del workflow di qualità adottato e il consolidamento di standard redazionali superiori in tutte le fasi di produzione documentale.