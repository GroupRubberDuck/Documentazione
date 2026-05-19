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

Il TCPI si mantiene costantemente sopra la soglia ottimale di 1.0 per tutti
gli sprint, con una leggera crescita. Sebbene lo scostamento sembri contenuto,
un TCPI > 1 indica che il team dovrà sostenere un'efficienza superiore a quella
media dimostrata finora per rientrare nel BAC.
#line(length: 100%, stroke: 0.5pt + luma(180))
A partire dallo Sprint 9, coincidente con l'avvio della Product Baseline (PB), il TCPI si mantiene costantemente al di sopra della soglia di 1.0. Tale andamento indica che, per completare il progetto rispettando il Budget at Completion (BAC) originariamente pianificato, il gruppo dovrebbe operare con un'efficienza superiore rispetto a quella mantenuta finora. L'incremento del valore riflette l'impatto dei ritardi accumulati nelle fasi iniziali — in particolare durante la curva di apprendimento tecnologico e la fase di stesura dei casi d'uso  — e la conseguente riduzione del budget residuo rispetto alle attività rimanenti. Le dinamiche che hanno condotto a questo scenario sono analizzate in dettaglio nel #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Piano di Progetto].