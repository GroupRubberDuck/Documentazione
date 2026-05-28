#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-bc = csv("../../../data/MPD/06-branch_coverage.csv").slice(1)

#let x-labels       = data-bc.map(row => row.at(0).replace("Sprint ", "S"))
#let fe-tot         = data-bc.map(row => float(row.at(1)))
#let fe-cop         = data-bc.map(row => float(row.at(2)))
#let fe-man         = data-bc.map(row => float(row.at(3)))
#let fe-pct         = data-bc.map(row => float(row.at(4)))
#let be-tot         = data-bc.map(row => float(row.at(5)))
#let be-cop         = data-bc.map(row => float(row.at(6)))
#let be-man         = data-bc.map(row => float(row.at(7)))
#let be-pct         = data-bc.map(row => float(row.at(8)))
#let values-accett  = data-bc.map(row => float(row.at(9)))

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
      text(fill: white, weight: "bold")[Branch Totali],
      text(fill: white, weight: "bold")[Branch Coperti],
      text(fill: white, weight: "bold")[Branch Mancanti],
      text(fill: white, weight: "bold")[Coverage %],
    ),

    ..data-bc.map(row => (
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
  caption: [Branch Coverage Frontend e Backend per sprint],
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
    "Branch Coverage per Sprint",
    y-label: "Coverage (%)",
    x-label: "Sprint",
    y-min: 0,
    y-max: 105,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
La branch coverage misura la percentuale di percorsi decisionali (branch) eseguiti all'interno del codice sorgente durante i test. 

L'andamento evidenzia una solida progressione in entrambe le aree. Il Backend ha visto un miglioramento continuo, partendo dall'*81,93%* nello Sprint 12 fino a raggiungere *89,81%* nello Sprint 14, superando stabilmente la soglia accettabile. Il Frontend, la cui copertura tramite test è stata implementata a partire dallo Sprint finale, ha debuttato con un risultato del *90,90%*, confermando un'ottima solidità decisionale su tutto l'applicativo.