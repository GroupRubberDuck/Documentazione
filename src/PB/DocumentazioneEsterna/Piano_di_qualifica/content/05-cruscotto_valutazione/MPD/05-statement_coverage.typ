#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-sc = csv("../../../data/MPD/05-statement_coverage.csv").slice(1)

#let x-labels       = data-sc.map(row => row.at(0).replace("Sprint ", "S"))
#let fe-tot         = data-sc.map(row => float(row.at(1)))
#let fe-cop         = data-sc.map(row => float(row.at(2)))
#let fe-man         = data-sc.map(row => float(row.at(3)))
#let fe-pct         = data-sc.map(row => float(row.at(4)))
#let be-tot         = data-sc.map(row => float(row.at(5)))
#let be-cop         = data-sc.map(row => float(row.at(6)))
#let be-man         = data-sc.map(row => float(row.at(7)))
#let be-pct         = data-sc.map(row => float(row.at(8)))
#let values-accett  = data-sc.map(row => float(row.at(9)))

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
    columns: (auto, auto, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[Area],
      text(fill: white, weight: "bold")[Statement Totali],
      text(fill: white, weight: "bold")[Statement Coperti],
      text(fill: white, weight: "bold")[Statement Mancanti],
      text(fill: white, weight: "bold")[Coverage %],
    ),

    ..data-sc.map(row => (
      row.at(0),
      "Frontend",
      if row.at(1) == "0" { "-" } else { fmt(float(row.at(1))) },
      if row.at(1) == "0" { "-" } else { fmt(float(row.at(2))) },
      if row.at(1) == "0" { "-" } else { fmt(float(row.at(3))) },
      if row.at(1) == "0" { "-" } else { fmt(float(row.at(4))) + "%" },
      
      row.at(0),
      "Backend",
      fmt(float(row.at(5))),
      fmt(float(row.at(6))),
      fmt(float(row.at(7))),
      fmt(float(row.at(8))) + "%"
    )).flatten()
  ),
  caption: [Statement Coverage Frontend e Backend per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "Coverage Frontend %": fe-pct,
      "Coverage Backend %": be-pct,
      "Soglia Accettabile":   values-accett,
      series-names: ("Coverage Frontend %", "Coverage Backend %", "Soglia Accettabile"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Statement Coverage per Sprint",
    y-label: "Coverage (%)",
    x-label: "Sprint",
    y-min: 0,
    y-max: 105,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
La statement coverage misura la percentuale di istruzioni del codice sorgente eseguite durante la test suite, suddivisa tra componenti Frontend e Backend.

Nel corso degli sprint analizzati si osserva un miglioramento costante per entrambe le aree. La metrica ha superato abbondantemente la soglia accettabile di *≥ 80%*, con il Backend che registra valori leggermente inferiori rispetto al Frontend per via della sua logica più complessa.