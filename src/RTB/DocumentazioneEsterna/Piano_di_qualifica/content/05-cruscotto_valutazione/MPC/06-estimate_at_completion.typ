#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati EAC
#let data-eac = csv("../../../data/MPC/06-estimate_at_completion.csv").slice(1)
#let values-eac = data-eac.map(row => float(row.at(1)))

// Estrazione etichette
#let x-labels = data-eac.map(row => row.at(0))

// Valore BAC costante
#let bac-value = 11610
#let values-bac = x-labels.map(_ => float(bac-value))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    EAC: values-eac,
    BAC: values-bac,
    series-names: ("EAC", "BAC"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Stima al Completamento (EAC)",
  y-label: "Valore (€)",
  x-label: "Sprint",
)

Stima del costo totale finale del progetto, ricalcolata in corso d'opera. Serve a prevedere se si finirà dentro o fuori budget rispetto al BAC. Ottimale: EAC ≤ BAC