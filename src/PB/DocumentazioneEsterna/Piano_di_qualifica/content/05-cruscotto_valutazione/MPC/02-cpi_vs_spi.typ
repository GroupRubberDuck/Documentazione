#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-cpi = csv("../../../data/MPC/05-cost_performance_index.csv").slice(1)
#let data-spi = csv("../../../data/MPC/04-schedule_performance_index.csv").slice(1)

#let x-labels   = data-cpi.map(row => row.at(0))
#let values-cpi = data-cpi.map(row => float(row.at(1)))
#let values-spi = data-spi.map(row => float(row.at(1)))

// Soglie
#let threshold-ottimo      = data-cpi.map(row => 1.0)
#let threshold-accettabile = data-cpi.map(row => 0.9)

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

// Giudizio combinato CPI + SPI
#let giudizio(cpi, spi) = {
  if cpi >= 1.0 and spi >= 1.0 {
    "Ottimo"
  } else if cpi >= 1.0 and spi < 1.0 {
    "Sotto budget, scheduling da monitorare"
  } else if cpi >= 0.9 and spi >= 1.0 {
    "Scheduling in linea, costi accettabili"
  } else if cpi >= 0.9 and spi >= 0.95 {
    "Accettabile"
  } else if cpi >= 0.8 and spi >= 1.0 {
    "Scheduling in linea, costi da ridurre"
  } else if cpi >= 0.8 and spi >= 0.95 {
    "Costi elevati, scheduling quasi in linea"
  } else if cpi >= 0.8 and spi < 0.95 {
    "Costi elevati e ritardo accumulato"
  } else {
    "Critico — intervento necessario"
  }
}

// ── Tabella ──────────────────────────────────────────────────────────────────
#figure(
  table(
    columns: (auto, 1fr, 1fr, 2.5fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    table.header(
      text(fill: white, weight: "bold")[sprint],
      text(fill: white, weight: "bold")[CPI],
      text(fill: white, weight: "bold")[SPI],
      text(fill: white, weight: "bold")[Giudizio],
    ),

    ..x-labels.enumerate().map(((i, sprint)) => (
      sprint,
      fmt(values-cpi.at(i)),
      fmt(values-spi.at(i)),
      giudizio(values-cpi.at(i), values-spi.at(i)),
    )).flatten()
  ),
  caption: [CPI e SPI per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#grafico-multi-linea(
  (
    x-labels: x-labels,
    CPI: values-cpi,
    SPI: values-spi,
    Ottimo: threshold-ottimo,
    Accettabile: threshold-accettabile,
    series-names: ("CPI", "SPI", "Ottimo", "Accettabile"),
    show-labels: true,
    label-size: 7pt,
    grid-opacity: 10%,
  ),
  "Cost Performance Index e Schedule Performance Index",
  y-label: "Indice",
  x-label: "Sprint",
  y-min: 0.8,
  y-max: 1.05,
  series-colors: (
    rgb("#1a73e8"),      // CPI — blu
    rgb("#e8541a"),      // SPI — arancione
    rgb(150, 200, 150),  // Ottimo — verde tenue
    rgb(220, 180, 120),  // Accettabile — giallo tenue
  ),
  series-thickness: (2pt, 2pt, 0.8pt, 0.8pt),
)

Il CPI si mantiene costantemente al di sotto della soglia accettabile per tutti
gli sprint, a indicare un utilizzo del budget superiore al previsto. L'SPI invece
rimane prossimo a 1, dimostrando che il team ha rispettato la pianificazione
temporale. Il miglioramento del CPI osservato a partire dai sprint centrali è
parzialmente riconducibile a una riorganizzazione del lavoro successiva alla
sessione esami. Le cause degli scostamenti sono documentate nel
#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Piano di Progetto].
