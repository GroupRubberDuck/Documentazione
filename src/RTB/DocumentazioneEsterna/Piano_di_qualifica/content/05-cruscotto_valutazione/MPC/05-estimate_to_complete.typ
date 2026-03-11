#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-time-eac = csv("../../../data/MPC/15-process_lead_time.csv").slice(1)

#let values-time-eac = data-time-eac.map(row => float(row.at(1)))

// Soglia: durata pianificata (18 settimane)
#let threshold = data-time-eac.map(row => 18.0)

// Estrazione etichette
#let x-labels = data-time-eac.map(row => row.at(0))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    TimeEAC: values-time-eac,
    Pianificato: threshold,
    series-names: ("TimeEAC", "Pianificato"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
    decimal-places: 2,
  ),
  "Stima Durata Finale del Progetto (Time EAC)",
  y-label: "Settimane",
  x-label: "Sprint",
  y-min: 10,
  y-max: 25,
)

Il TimeEAC si mantiene costantemente allineato al pianificato per tutti gli sprint, con uno scostamento massimo nello Sprint 4 dovuto alla sessione esami. Nello Sprint 5 il TimeEAC si riduce leggermente rispetto al picco precedente, segnale che il team ha recuperato parte del ritmo perduto.
#pagebreak()