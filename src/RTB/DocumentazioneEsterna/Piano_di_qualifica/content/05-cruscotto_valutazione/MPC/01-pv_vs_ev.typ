#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati dai due file separati

#let data-pv = csv("../../../data/MPC/01-planned_value.csv").slice(1)

#let data-ev = csv("../../../data/MPC/02-earned_value.csv").slice(1)



// Estrazione etichette

#let x-labels = data-pv.map(row => row.at(0))



// Estrazione valori numerici

#let values-pv = data-pv.map(row => float(row.at(1)))

#let values-ev = data-ev.map(row => float(row.at(1)))


#grafico-multi-linea(
  (
    x-labels: x-labels,
    PV: values-pv,
    EV: values-ev,
    series-names: ("PV", "EV"),
    show-labels: true,
    label-size: 7pt,
    grid-opacity: 10%,
  ),
  "Andamento Metriche EV e PV",
  y-label: "Valore (€)",
  x-label: "Sprint",
)