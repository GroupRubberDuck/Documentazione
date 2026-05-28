#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-fd = csv("../../../data/MPD/04-failure_density.csv").slice(1)

#let x-labels      = data-fd.map(row => row.at(0).replace("Sprint ", "S"))
#let fe-fd         = data-fd.map(row => float(row.at(1)))
#let be-fd         = data-fd.map(row => float(row.at(2)))
#let values-accett = data-fd.map(row => float(row.at(3)))

#let fmt(n) = {
  let s = str(calc.round(n, digits: 2))
  if "." not in s { s = s + ",00" }
  else {
    let parts = s.split(".")
    let dec = parts.at(1)
    if dec.len() == 1 { dec = dec + "0" }
    s = parts.at(0) + "," + dec
  }
  s
}

// ── Tabella ──────────────────────────────────────────────────────────────────
#figure(
  table(
    columns: (auto, auto, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[Area],
      text(fill: white, weight: "bold")[Failure Density/KLOC],
      text(fill: white, weight: "bold")[Soglia Accettabile],
    ),

    ..data-fd.map(row => (
      row.at(0),
      "Frontend",
      if row.at(0) != "Sprint 14" { "-" } else { fmt(float(row.at(1))) },
      fmt(float(row.at(3))),

      row.at(0),
      "Backend",
      fmt(float(row.at(2))),
      fmt(float(row.at(3)))
    )).flatten()
  ),
  caption: [Failure Density per sprint (Frontend e Backend)],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "FE Density/KLOC": fe-fd,
      "BE Density/KLOC": be-fd,
      "Soglia Accettabile": values-accett,
      series-names: ("FE Density/KLOC", "BE Density/KLOC", "Soglia Accettabile"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Failure Density per Sprint",
    y-label: "Failure Density / KLOC",
    x-label: "Sprint",
    y-min: 0,
    y-max: 0.7,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
La failure density misura il numero di test falliti per KLOC di codice sorgente. Il Backend ha registrato un lieve valore fisiologico di *0,12* nello Sprint 12, prontamente azzerato negli sprint successivi (*0,00*). Il Frontend, i cui test sono stati introdotti nello Sprint 14, ha debuttato con un valore  di *0,00*. Entrambe le aree si mantengono ampiamente al di sotto della soglia accettabile di *≤ 0,50*.