#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-req = csv("../../../data/MPD/01-requisiti_soddisfatti.csv").slice(1)

#let x-labels   = data-req.map(row => row.at(0).replace("Sprint ", "S"))
#let obb-tot    = data-req.map(row => row.at(1))
#let obb-sodd   = data-req.map(row => row.at(2))
#let obb-pct    = data-req.map(row => float(row.at(3)))

#let des-tot    = data-req.map(row => row.at(4))
#let des-sodd   = data-req.map(row => row.at(5))
#let des-pct    = data-req.map(row => float(row.at(6)))

#let opz-tot    = data-req.map(row => row.at(7))
#let opz-sodd   = data-req.map(row => row.at(8))
#let opz-pct    = data-req.map(row => float(row.at(9)))

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
    columns: (auto, auto, auto, auto, auto, auto, auto),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[Obb. Sodd/Tot],
      text(fill: white, weight: "bold")[Obb. %],
      text(fill: white, weight: "bold")[Des. Sodd/Tot],
      text(fill: white, weight: "bold")[Des. %],
      text(fill: white, weight: "bold")[Opz. Sodd/Tot],
      text(fill: white, weight: "bold")[Opz. %],
    ),

    ..data-req.map(row => (
      row.at(0),
      row.at(2) + " / " + row.at(1),
      fmt(float(row.at(3))) + "%",
      row.at(5) + " / " + row.at(4),
      fmt(float(row.at(6))) + "%",
      row.at(8) + " / " + row.at(7),
      fmt(float(row.at(9))) + "%",
    )).flatten()
  ),
  caption: [Avanzamento e soddisfacimento dei requisiti per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "Obbligatori %": obb-pct,
      "Desiderabili %": des-pct,
      "Opzionali %": opz-pct,
      series-names: ("Obbligatori %", "Desiderabili %", "Opzionali %"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Percentuale di Requisiti Soddisfatti",
    y-label: "Completamento (%)",
    x-label: "Sprint",
    y-min: 0,
    y-max: 105,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
Il monitoraggio dei requisiti evidenzia l'efficacia della pianificazione iterativa e incrementale adottata dal team. 

// ── Descrizione ───────────────────────────────────────────────────────────────
Il team ha dato priorità assoluta ai **Requisiti Obbligatori** (100) e **Desiderabili** (4), completandoli entrambi al *100%*. Avendo consolidato le funzionalità principali in anticipo, l'ultima fase dello Sprint 14 è stata dedicata ai **Requisiti Opzionali** (112), di cui ne sono stati soddisfatti 16, raggiungendo una copertura finale del *14%*.