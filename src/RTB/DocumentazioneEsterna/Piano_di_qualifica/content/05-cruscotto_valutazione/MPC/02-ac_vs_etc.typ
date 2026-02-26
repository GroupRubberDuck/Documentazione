#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati dai due file separati

#let data-ac = csv("../../../data/MPC/03-actual_cost.csv").slice(1)
#let data-etc = csv("../../../data/MPC/08-estimate_to_complete.csv").slice(1)

#let values-ac = data-ac.map(row => float(row.at(1)))
#let values-etc = data-etc.map(row => float(row.at(1)))


// Estrazione etichette

#let x-labels = data-ac.map(row => row.at(0))



#grafico-multi-linea(
  (
    x-labels: x-labels,
    AC: values-ac,
    ETC: values-etc,
    series-names: ("AC", "ETC"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Andamento Metriche AC e ETC",
  y-label: "Valore (€)",
  x-label: "Sprint",
)

Confronto tra quanto già speso (AC) e quanto si stima di spendere per completare il progetto (ETC). Serve a valutare se le risorse rimanenti sono sufficienti o se si sta andando fuori budget. Ottimale: ETC decrescente nel tempo, AC ≤ budget pianificato.
cviaone 