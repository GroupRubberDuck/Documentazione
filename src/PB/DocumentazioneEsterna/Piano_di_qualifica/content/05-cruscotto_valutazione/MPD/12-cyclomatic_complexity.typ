#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-cc = csv("../../../data/MPD/12-cyclomatic_complexity.csv").slice(1)

#let x-labels       = data-cc.map(row => row.at(0).replace("Sprint ", "S"))
#let func-tot       = data-cc.map(row => row.at(1))
#let comp-avg       = data-cc.map(row => float(row.at(2)))
#let comp-max       = data-cc.map(row => float(row.at(3)))
#let rank-a         = data-cc.map(row => row.at(4))
#let rank-b         = data-cc.map(row => row.at(5))
#let rank-c         = data-cc.map(row => row.at(6))
#let rank-d         = data-cc.map(row => row.at(7))
#let rank-e         = data-cc.map(row => row.at(8))
#let rank-f         = data-cc.map(row => row.at(9))
#let values-accett  = data-cc.map(row => float(row.at(10)))

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
    columns: (auto, auto, auto, auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[Funzioni],
      text(fill: white, weight: "bold")[Compl. Media],
      text(fill: white, weight: "bold")[Compl. Max],
      text(fill: white, weight: "bold")[A],
      text(fill: white, weight: "bold")[B],
      text(fill: white, weight: "bold")[C],
      text(fill: white, weight: "bold")[D],
      text(fill: white, weight: "bold")[E],
      text(fill: white, weight: "bold")[F],
    ),

    ..data-cc.map(row => (
      row.at(0),
      row.at(1),
      fmt(float(row.at(2))),
      row.at(3),
      row.at(4),
      row.at(5),
      row.at(6),
      row.at(7),
      row.at(8),
      row.at(9),
    )).flatten()
  ),
  caption: [Complessità Ciclomatica per sprint e distribuzione dei Rank],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "Complessità Max": comp-max,
      "Complessità Media": comp-avg,
      "Soglia Accettabile (Max)": values-accett,
      series-names: ("Complessità Max", "Complessità Media", "Soglia Accettabile (Max)"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Andamento Complessità Ciclomatica",
    y-label: "Valore Complessità",
    x-label: "Sprint",
    y-min: 0,
    y-max: 18,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
La complessità ciclomatica misura il numero di percorsi linearmente indipendenti attraverso il codice sorgente.

Nonostante il numero totale di funzioni sia quasi quintuplicato dallo Sprint 12 allo Sprint 14, la complessità media si è abbassata, assestandosi a *1,84*. La complessità massima registrata è pari a *8*, ampiamente al di sotto della soglia accettabile di *≤ 15*. La quasi totalità delle funzioni ricade nel *Rank A* (complessità minima), con solo pochissime eccezioni confinate nel *Rank B*, confermando un'architettura del codice estremamente pulita e modulare.