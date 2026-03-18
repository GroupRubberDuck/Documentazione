#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati 
#let data-eT = csv("../../../data/MPC/14-time_efficiency.csv").slice(1)
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
  y-min: 0.5,
  y-max: 1.5,
)

Il team ha mantenuto una Time Efficiency costantemente prossima a 1 per tutti gli sprint, attestandosi leggermente al di sotto della soglia ottimale.
Ciò indica che le ore effettivamente impiegate sono state in media superiori
a quelle previste, pur rimanendo entro limiti accettabili.\ Il valore va tuttavia confrontato con la qualità del lavoro prodotto e con l'accuratezza delle stime di tempo e costo, per ottenere una valutazione completa dell'efficienza del team.
