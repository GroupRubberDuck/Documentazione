#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-eT = csv("../../../data/MPC/14-time_efficiency.csv").slice(1)
#let values-eT = data-eT.map(row => float(row.at(1)))
#let x-labels  = data-eT.map(row => row.at(0))

// Soglia ottimale
#let threshold-ottimo = data-eT.map(row => 1.0)

// Formattazione a 2 decimali con virgola
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

// Giudizio eT
#let giudizio-et(v) = {
  if v >= 1.05 {
    "Ottimo — ore sotto il previsto"
  } else if v >= 0.95 {
    "In linea — efficienza nella norma"
  } else if v >= 0.85 {
    "Accettabile — lieve superamento ore"
  } else {
    "Attenzione — ore significativamente superiori"
  }
}

// ── Tabella ──────────────────────────────────────────────────────────────────
#figure(
  table(
    columns: (auto, 1fr, 3fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },
    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[eT],
      text(fill: white, weight: "bold")[Giudizio],
    ),
    ..x-labels.enumerate().map(((i, sprint)) => (
      sprint,
      fmt(values-eT.at(i)),
      giudizio-et(values-eT.at(i)),
    )).flatten()
  ),
  caption: [Efficienza Temporale per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#grafico-multi-linea(
  (
    x-labels: x-labels,
    eT: values-eT,
    Ottimale: threshold-ottimo,
    series-names: ("eT", "Ottimale"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Efficienza Temporale (eT)",
  y-label: "Indice",
  x-label: "Sprint",
  y-min: 0.5,
  y-max: 1.5,
  series-colors: (
    rgb("#1a73e8"),      // eT — blu
    rgb(180, 180, 180),  // Ottimale — grigio tenue
  ),
  series-thickness: (2pt, 0.8pt),
)

Il team ha mantenuto una Time Efficiency costantemente prossima a 1 per tutti
gli sprint, attestandosi leggermente al di sotto della soglia ottimale.
Ciò indica che le ore effettivamente impiegate sono state in media superiori
a quelle previste, pur rimanendo entro limiti accettabili.
Il valore va tuttavia confrontato con la qualità del lavoro prodotto e con
l'accuratezza delle stime di tempo e costo, per ottenere una valutazione
completa dell'efficienza del team.
