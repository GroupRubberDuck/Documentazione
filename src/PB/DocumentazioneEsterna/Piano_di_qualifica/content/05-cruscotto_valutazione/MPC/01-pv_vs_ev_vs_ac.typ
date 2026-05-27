#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-pv = csv("../../../data/MPC/01-planned_value.csv").slice(1)
#let data-ev = csv("../../../data/MPC/02-earned_value.csv").slice(1)
#let data-ac = csv("../../../data/MPC/03-actual_cost.csv").slice(1)

// Estrazione etichette (Abbreviate per il grafico, es. "S1", "S2")
#let x-labels = data-pv.map(row => row.at(0).replace("Sprint ", "S"))

// Estrazione valori numerici (già accumulati)
#let values-pv = data-pv.map(row => float(row.at(1)))
#let values-ev = data-ev.map(row => float(row.at(1)))
#let values-ac = data-ac.map(row => float(row.at(1)))

// Formattazione numero con 2 decimali e separatore europeo
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
    columns: (auto, 1fr, 1fr, 1fr),
    align: center + horizon,
    fill: (col, row) => if row == 0 { rgb("#1a2e44") } else { white },

    // Intestazione
    table.header(
      text(fill: white, weight: "bold")[sprint],
      text(fill: white, weight: "bold")[PV acc. (€)],
      text(fill: white, weight: "bold")[EV acc. (€)],
      text(fill: white, weight: "bold")[AC acc. (€)],
    ),

    // Righe dati (qui usiamo l'etichetta originale non abbreviata)
    ..data-pv.map(row => row.at(0)).enumerate().map(((i, sprint)) => (
      sprint,
      fmt(values-pv.at(i)),
      fmt(values-ev.at(i)),
      fmt(values-ac.at(i)),
    )).flatten()
  ),
  caption: [Valori di PV, EV e AC accumulati per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
// Opzione A: allarghiamo lo spazio a disposizione del grafico usando pad
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      PV: values-pv,
      EV: values-ev,
      AC: values-ac,
      series-names: ("PV", "EV", "AC"),
      show-labels: true,
      label-size: 6pt, // Testo ridotto per limitare gli ingombri
      grid-opacity: 10%,
      x-tick-angle: -45deg, // Opzione B: rotazione delle etichette (se supportato)
    ),
    "Andamento Metriche PV, EV e AC",
    y-label: "Valore (€)",
    x-label: "Sprint",
    y-min: 400,
    y-max: 12000
  )
]

Il team ha mantenuto un ritmo di avanzamento coerente con la pianificazione, con EV e PV
molto vicini. L'AC ha tuttavia superato costantemente entrambi,
evidenziando una tendenza strutturale a spendere più del previsto. Le cause e le contromisure adottate sono documentate nel
#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v2.0.0.pdf")[Piano di Progetto].
#line(length: 100%, stroke: 0.5pt + luma(180))
A partire da S9, corrispondente all'inizio della  PB, si osserva un'accelerazione nella crescita di EV, che tende a ridurre progressivamente il divario con PV. Questo segnala un miglioramento nell'efficacia del lavoro svolto rispetto alla pianificazione. L'AC continua a crescere a un ritmo sostenuto, ma nella parte finale del progetto (S12--S14) la sua pendenza si avvicina maggiormente a quella di EV, indicando una maggiore efficienza nella gestione dei costi rispetto agli sprint iniziali.