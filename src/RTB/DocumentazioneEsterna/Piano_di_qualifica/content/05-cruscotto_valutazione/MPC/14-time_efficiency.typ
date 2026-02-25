#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati 
#let data-eT = csv("../../../data/MPC/12-task_completion_on_time.csv").slice(1)
#let values-eT = data-eT.map(row => float(row.at(1)))

// Estrazione etichette

#let x-labels = data-eT.map(row => row.at(0))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    eT: values-eT,
    series-names: ("eT",),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Efficienza Temporale",
  y-label: "Indice",
  x-label: "Sprint",
)


Rapporto tra il tempo stimato e il tempo effettivamente impiegato per completare le attività. Serve a valutare la precisione della pianificazione e la produttività del team. Ottimale: ≥ 1 (si impiega meno o uguale al previsto).