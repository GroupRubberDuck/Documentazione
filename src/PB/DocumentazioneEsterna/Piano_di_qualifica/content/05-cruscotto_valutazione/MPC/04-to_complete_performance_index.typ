#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-tcpi = csv("../../../data/MPC/07-to_complete_performance_index.csv").slice(1)

// Estrazione etichette (usiamo S1, S2... per evitare sovrapposizioni)
#let x-labels-full = data-tcpi.map(row => row.at(0))
#let x-labels-short = data-tcpi.map(row => row.at(0).replace("Sprint ", "S"))
#let values-tcpi = data-tcpi.map(row => float(row.at(1)))

// Soglia ottimale (TCPI = 1)
#let threshold = data-tcpi.map(row => 1.0)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels-short,
      TCPI: values-tcpi,
      Soglia: threshold,
      series-names: ("TCPI", "Soglia"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 20%,
      x-tick-angle: -45deg, // Inclinazione etichette per leggibilità
    ),
    "Andamento To Complete Performance Index (TCPI)",
    y-label: "Indice",
    x-label: "Sprint",
    y-min: 0.7,
    y-max: 2.8,
    series-colors: (
      rgb("#1a73e8"),      // TCPI — blu
      rgb(180, 180, 180),  // Soglia — grigio
    ),
    series-thickness: (2pt, 0.8pt),
  )
]


Dallo S9 (inizio PB), il TCPI supera stabilmente 1.0, indicando la necessità di un'efficienza maggiore per rispettare il BAC. L'aumento riflette la riduzione del budget residuo a causa dei ritardi iniziali legati all'apprendimento tecnologico e ai casi d'uso. L'analisi dettagliata è disponibile nel #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v2.0.0.pdf")[Piano di Progetto].