#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-co = csv("../../../data/MPC/12-correttezza_ortografica.csv").slice(1)

#let values-co = data-co.map(row => float(row.at(1)))

// Soglia ottimale (TCPI = 1)
#let threshold = data-co.map(row => 1.0)

// Estrazione etichette
#let x-labels = data-co.map(row => row.at(0))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    co: values-co,
    Soglia: threshold,
    series-names: ("co",),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
    decimal-places: 4,
  ),
  "Andamento Correttezza ortografica",
  y-label: "Errori",
  x-label: "Sprint",
)


Percentuale di errori ortografici presenti nei documenti. Serve a garantire la qualità formale della documentazione. Ottimale: 0 errori.