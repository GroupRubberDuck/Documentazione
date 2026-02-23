#import "/src/config.typ":template_dir,he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#grafico-multi-linea(
  (
    x-labels: ("Sprint 1", "Sprint 2", "Sprint 3", "Sprint 4"),
    PV: (455, 845, 1230, 1395),
    EV: (455, 845, 1230, 1395),
    series-names: ("PV", "EV"),
  ),
  "Grafico a linee delle metriche EV e PV",
)


