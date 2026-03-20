#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-time-eac = csv("../../../data/MPC/15-process_lead_time.csv").slice(1)

#let values-time-eac = data-time-eac.map(row => float(row.at(1)))

// Soglia: durata pianificata (18 settimane)
#let threshold = data-time-eac.map(row => 24.0)

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
  y-min: 23,
  y-max: 26,
)

Il TimeEAC si mantiene generalmente allineato al pianificato, con scostamenti contenuti riconducibili a rallentamenti puntuali come la sessione esami, seguiti da parziali recuperi negli sprint successivi. Il dato va tuttavia letto con cautela: il completamento delle task nei tempi previsti non riflette necessariamente la qualità del lavoro svolto. Task chiuse parzialmente hanno generato attività correttive negli sprint successivi, contribuendo a un ritardo reale non completamente catturato dalla metrica, come evidenziato dall'andamento del consuntivo superiore al preventivo.
