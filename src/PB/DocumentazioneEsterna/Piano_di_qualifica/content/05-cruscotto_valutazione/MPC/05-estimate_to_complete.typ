#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Formattazione numeri
#let fmt(n, digits: 2) = {
  let s = str(calc.round(n, digits: digits))
  if "." not in s { s = s + ",00" }
  else {
    let parts = s.split(".")
    let dec = parts.at(1)
    if dec.len() == 1 { dec = dec + "0" }
    s = parts.at(0) + "," + dec
  }
  s
}

// ═══════════════════════════════════════════════════════════════════════════
// GRAFICO 1: TimeEAC vs Pianificato (SETTIMANE)
// ═══════════════════════════════════════════════════════════════════════════
#let data-time-eac  = csv("../../../data/MPC/15-process_lead_time.csv").slice(1)
#let values-time-eac = data-time-eac.map(row => float(row.at(1)))
#let threshold-time  = data-time-eac.map(row => 24.0)
#let x-labels-full   = data-time-eac.map(row => row.at(0))
#let x-labels-short  = x-labels-full.map(s => s.replace("Sprint ", "S"))

#let giudizio-time(v) = {
  let delta = v - 24.0
  if delta <= 0.0 { "In anticipo / in linea" }
  else if delta <= 0.5 { "Lieve ritardo" }
  else if delta <= 1.0 { "Ritardo moderato" }
  else { "Ritardo significativo" }
}

#figure(
  table(
    columns: (auto, 1fr, 1fr, 2.5fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },
    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[TimeEAC (sett.)],
      text(fill: white, weight: "bold")[Scostamento],
      text(fill: white, weight: "bold")[Giudizio],
    ),
    ..x-labels-full.enumerate().map(((i, sprint)) => {
      let v = values-time-eac.at(i)
      let delta = v - 24.0
      let delta-str = if delta >= 0 { "+" + fmt(delta) } else { fmt(delta) }
      (sprint, fmt(v), delta-str, giudizio-time(v))
    }).flatten()
  ),
  caption: [TimeEAC per sprint],
)

#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels-short,
      TimeEAC: values-time-eac,
      Pianificato: threshold-time,
      series-names: ("TimeEAC", "Pianificato"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 20%,
      x-tick-angle: -45deg,
    ),
    "Stima Durata Finale del Progetto (Time EAC)",
    y-label: "Settimane",
    x-label: "Sprint",
    y-min: 23,
    y-max: 37,
    series-colors: (rgb("#1a73e8"), rgb(180, 180, 180)),
    series-thickness: (2pt, 0.8pt),
  )
]
Il TimeEAC si mantiene allineato al pianificato, salvo rallentamenti temporanei come la sessione esami. La puntualità non ha però rispecchiato sempre la qualità: la chiusura parziale di alcune task ha generato rilavorazioni nei periodi successivi (#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Piano di Progetto]).
#line(length: 100%, stroke: 0.5pt + luma(180))
In linea fino allo S9, il TimeEAC ha poi registrato un ritardo complessivo di circa un mese. Lo slittamento è dovuto ai debiti pregressi accumulati a causa della curva di apprendimento tecnologico e della sottostima delle attività di verifica e analisi (#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Piano di Progetto]).

// ═══════════════════════════════════════════════════════════════════════════
// GRAFICO 2: AC vs ETC vs EAC (COSTI)
// ═══════════════════════════════════════════════════════════════════════════
#let data-ac  = csv("../../../data/MPC/03-actual_cost.csv").slice(1)
#let data-eac = csv("../../../data/MPC/06-estimate_at_completion.csv").slice(1)

#let values-ac  = data-ac.map(row => float(row.at(1)))
#let values-eac = data-eac.map(row => float(row.at(1)))
#let values-etc = values-ac.zip(values-eac).map(pair => pair.at(1) - pair.at(0))

#let x-labels-cost = data-ac.map(row => row.at(0))
#let x-labels-cost-short = x-labels-cost.map(s => s.replace("Sprint ", "S"))
#let bac-value = 11610
#let values-bac = x-labels-cost.map(_ => float(bac-value))

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },
    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[AC (€)],
      text(fill: white, weight: "bold")[ETC (€)],
      text(fill: white, weight: "bold")[EAC (€)],
      text(fill: white, weight: "bold")[EAC vs BAC],
    ),
    ..x-labels-cost.enumerate().map(((i, sprint)) => {
      let ac  = values-ac.at(i)
      let etc = values-etc.at(i)
      let eac = values-eac.at(i)
      let delta = eac - bac-value
      let delta-str = if delta >= 0 { "+" + fmt(delta, digits: 0) + "€" } else { fmt(delta, digits: 0) + "€" }
      (sprint, fmt(ac, digits: 0) + "€", fmt(etc, digits: 0) + "€", fmt(eac, digits: 0) + "€", delta-str)
    }).flatten()
  ),
  caption: [AC, ETC ed EAC per sprint],
)

#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels-cost-short,
      AC: values-ac,
      ETC: values-etc,
      EAC: values-eac,
      BAC: values-bac,
      series-names: ("AC", "ETC", "EAC", "BAC"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 20%,
      x-tick-angle: -45deg,
    ),
    "Actual Cost, Estimate To Complete e Estimate At Completion",
    y-label: "Valore (€)",
    x-label: "Sprint",
    series-colors: (rgb("#e8541a"), rgb("#2ecc71"), rgb("#1a73e8"), rgb(180, 180, 180)),
    series-thickness: (2pt, 2pt, 2pt, 0.8pt),
  )
]


Il progetto si conclude con un mese di ritardo rispetto alle stime originarie, ma il costo effettivo finale (AC) è stato contenuto, mantenendosi al di sotto del budget totale pianificato (BAC di 11.610€).
#line(length: 100%, stroke: 0.5pt + luma(180))
Dallo S9 (inizio PB), l'introduzione di un workflow strutturato e della Continuous Integration ha stabilizzato l'efficienza. Il costante miglioramento degli indicatori CPI e SPI conferma il successo delle azioni correttive, che hanno garantito ritmi di lavoro sostenibili e una qualità del codice conforme agli standard.