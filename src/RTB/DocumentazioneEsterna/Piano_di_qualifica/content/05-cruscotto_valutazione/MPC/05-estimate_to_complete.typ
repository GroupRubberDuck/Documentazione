#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-time-eac = csv("../../../data/MPC/15-process_lead_time.csv").slice(1)

#let values-time-eac = data-time-eac.map(row => float(row.at(1)))

// Soglia: durata pianificata (8 settimane)
#let threshold = data-time-eac.map(row => 8.0)

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
  y-min: 4,
  y-max: 10,
)

Il TimeEAC si mantiene costantemente allineato per tutti
gli sprint, con uno scostamento  nello Sprint 4. Questo
conferma che, nonostante il CPI leggermente sotto 1, il team ha rispettato
sostanzialmente la schedulazione temporale prevista. Il lieve aumento finale è
riconducibile alla sessione esami dello Sprint 4 che ha ridotto la produttività.