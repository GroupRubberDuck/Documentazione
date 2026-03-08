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
  y-min: 1,
  y-max: 1.2,
)

Il TCPI parte da 1.0 nello Sprint 1 e cresce gradualmente fino a 1.03 nello Sprint 5, mantenendosi sempre molto vicino alla soglia ottimale. Tuttavia lo scostamento rimane contenuto e il TCPI non supera mai 1.05, indicando che per completare il progetto entro il BAC il team dovrà essere solo leggermente più efficiente di quanto fatto finora — un obiettivo realisticamente raggiungibile.