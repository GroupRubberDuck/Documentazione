#import "/src/config.typ": template_dir
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-eT = csv("../../../data/MPC/14-time_efficiency.csv").slice(1)
#let values-eT = data-eT.map(row => float(row.at(1)))

// Estrazione etichette abbreviate
#let x-labels-full = data-eT.map(row => row.at(0))
#let x-labels-short = x-labels-full.map(s => s.replace("Sprint ", "S"))

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
  if v >= 1.05 { "Ottimo — ore sotto il previsto" }
  else if v >= 0.91 { "In linea — efficienza nella norma" }
  else if v >= 0.85 { "Accettabile — lieve superamento ore" }
  else { "Attenzione — ore significativamente superiori" }
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
    ..x-labels-full.enumerate().map(((i, sprint)) => (
      sprint,
      fmt(values-eT.at(i)),
      giudizio-et(values-eT.at(i)),
    )).flatten()
  ),
  caption: [Efficienza Temporale per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels-short,
      eT: values-eT,
      Ottimale: threshold-ottimo,
      series-names: ("eT", "Ottimale"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 20%,
      x-tick-angle: -45deg,
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
]

La Time Efficiency si è mantenuta tra 0,8 e 0,95, restando costantemente prossima alla soglia ottimale. Nella fase RTB (S1--S8) l'andamento è risultato più instabile a causa della fisiologica inesperienza iniziale nella formulazione delle stime.
#line(length: 100%, stroke: 0.5pt + luma(180))
Dallo S9 (inizio PB), l'indicatore si è stabilizzato mostrando un progressivo miglioramento. L'avvicinamento all'ottimo negli sprint finali (S13--S14) conferma un netto affinamento nelle capacità di stima del team, pur mantenendo un lieve scostamento strutturale dovuto alla natura inedita del progetto.