#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-tcpi = csv("../../../data/MPC/07-to_complete_performance_index.csv").slice(1)

#let values-tcpi = data-tcpi.map(row => float(row.at(1)))

// Soglia ottimale (TCPI = 1)
#let threshold = data-tcpi.map(row => 1.0)

// Estrazione etichette
#let x-labels = data-tcpi.map(row => row.at(0))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    TCPI: values-tcpi,
    Soglia: threshold,
    series-names: ("TCPI", "Soglia"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
    decimal-places: 4,
  ),
  "Andamento To Complete Performance Index (TCPI)",
  y-label: "Indice",
  x-label: "Sprint",
  y-min: 0.8,
  y-max: 1.4,
)

Il TCPI si mantiene costantemente sopra la soglia ottimale di 1.0 per tutti
gli sprint, con una leggera crescita. Sebbene
lo scostamento sembri contenuto, un TCPI > 1 indica che il team dovrà sostenere
un'efficienza superiore a quella media dimostrata finora per rientrare nel BAC.
#pagebreak()
