#import "/src/config.typ": he, slugify, template_dir
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#grafico-multi-linea(
  (
    x-labels: ("Sprint 1", "Sprint 2", "Sprint 3", "Sprint 4"),
    CPI: (0.938, 0.949, 0.95, 0.909),
    SPI: (1.0, 1.0, 1.0, 1.0),
    series-names: ("CPI", "SPI"),
  ),
  "Grafico a linee delle metriche CPI e SPI",
)
