#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-tsr = csv("../../../data/MPD/0-test_success_rate.csv").slice(1)

#let x-labels      = data-tsr.map(row => row.at(0).replace("Sprint ", "S"))
#let fe-tot        = data-tsr.map(row => row.at(1))
#let fe-pass       = data-tsr.map(row => row.at(2))
#let fe-fail       = data-tsr.map(row => row.at(3))
#let fe-pct        = data-tsr.map(row => float(row.at(4)))
#let be-tot        = data-tsr.map(row => row.at(5))
#let be-pass       = data-tsr.map(row => row.at(6))
#let be-fail       = data-tsr.map(row => row.at(7))
#let be-pct        = data-tsr.map(row => float(row.at(8)))
#let values-accett = data-tsr.map(row => float(row.at(9)))

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
      text(fill: white, weight: "bold")[Test Totali],
      text(fill: white, weight: "bold")[Test Passati],
      text(fill: white, weight: "bold")[Test Falliti],
      text(fill: white, weight: "bold")[Pass Rate %],
    ),

    ..data-tsr.map(row => (
      row.at(0),
      "Frontend",
      if row.at(1) == "0" { "-" } else { row.at(1) },
      if row.at(1) == "0" { "-" } else { row.at(2) },
      if row.at(1) == "0" { "-" } else { row.at(3) },
      if row.at(1) == "0" { "-" } else { fmt(float(row.at(4))) + "%" },
      
      row.at(0),
      "Backend",
      row.at(5),
      row.at(6),
      row.at(7),
      fmt(float(row.at(8))) + "%"
    )).flatten()
  ),
  caption: [Test Success Rate per sprint (Frontend e Backend)],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "Pass Rate FE %": fe-pct,
      "Pass Rate BE %": be-pct,
      "Soglia Accettabile": values-accett,
      series-names: ("Pass Rate FE %", "Pass Rate BE %", "Soglia Accettabile"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Andamento Test Success Rate",
    y-label: "Pass Rate (%)",
    x-label: "Sprint",
    y-min: 0,
    y-max: 105,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
La metrica Test Success Rate indica la percentuale di test superati con successo rispetto al totale dei test eseguiti nella suite.

L'andamento mostra stabilità per l'intero periodo. I test del Backend hanno mantenuto costantemente un pass rate del *100%* in tutti gli sprint. Il Frontend, i cui test sono stati introdotti unicamente nell'ultimo sprint (216 esecuzioni), ha registrato fin da subito lo stesso risultato impeccabile (*100%*), beneficiando della solidità ormai raggiunta dal sistema.