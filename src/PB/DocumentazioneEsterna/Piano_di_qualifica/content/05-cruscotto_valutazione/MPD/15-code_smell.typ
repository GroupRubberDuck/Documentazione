#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-cs = csv("../../../data/MPD/15-code_smell.csv").slice(1)

#let x-labels       = data-cs.map(row => row.at(0).replace("Sprint ", "S"))
#let loc-tot        = data-cs.map(row => row.at(1))
#let viol-tot       = data-cs.map(row => row.at(3))
#let cs-100loc      = data-cs.map(row => float(row.at(4)))
#let cs-kloc        = data-cs.map(row => float(row.at(5)))
#let values-accett  = data-cs.map(row => float(row.at(6)))

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
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[LOC Totali],
      text(fill: white, weight: "bold")[Violazioni Totali],
      text(fill: white, weight: "bold")[Smells / KLOC],
      text(fill: white, weight: "bold")[Soglia Accettabile],
    ),

    ..data-cs.map(row => (
      row.at(0),
      row.at(1),
      row.at(3),
      fmt(float(row.at(5))),
      fmt(float(row.at(6)))
    )).flatten()
  ),
  caption: [Andamento dei Code Smells per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "Smells / KLOC": cs-kloc,
      "Soglia Accettabile": values-accett,
      series-names: ("Smells / KLOC", "Soglia Accettabile"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Code Smells per KLOC",
    y-label: "Densità (per KLOC)",
    x-label: "Sprint",
    y-min: 0,
    y-max: 6,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
La metrica Code Smells rileva le violazioni delle best practice di programmazione, calcolandone la densità ogni mille righe di codice sorgente (KLOC).

Il grafico evidenzia un costante lavoro di refactoring da parte del team. Partendo da un valore iniziale prossimo a *4,0* nello Sprint 12, la densità dei code smells è stata ridotta drasticamente a circa *1,0* nello Sprint 13, fino a raggiungere la totale assenza (*0,0*) al termine dello Sprint 14. 