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
  y-min: 0,
  y-max: 1,
)

Il team ha mantenuto una Time Efficiency costantemente vicina a 1 per tutti gli sprint,
con valori compresi tra 0.90 e 0.95. Questo indica che le ore effettivamente impiegate
sono state leggermente superiori a quelle stimate.
Il calo nello Sprint 4 è coerente con la riduzione di produttività dovuta alla sessione
esami. 
\ Complessivamente il team ha dimostrato una buona capacità di rispettare le
stime temporali, con margini di miglioramento nella precisione della pianificazione
delle ore per attività.