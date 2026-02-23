#import "/src/config.typ":template_dir,he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#grafico-multi-linea(
  (
    x-labels: ("Sprint 1", "Sprint 2", "Sprint 3", "Sprint 4"),
    ETC: (11890, 11338, 10929, 11240),
    AC: (485, 890, 1295, 1535),
    EAC: (12375.495, 12228.284, 12223.537, 12775.161),
    series-names: ("ETC", "AC", "EAC"),
  ),
  "Grafico a linee delle metriche ETC e AC",
)

