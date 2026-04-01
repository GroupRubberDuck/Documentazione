#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-pv = csv("../../../data/MPC/01-planned_value.csv").slice(1)
#let data-ev = csv("../../../data/MPC/02-earned_value.csv").slice(1)
#let data-ac = csv("../../../data/MPC/03-actual_cost.csv").slice(1)

// Estrazione etichette
#let x-labels = data-pv.map(row => row.at(0))

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

    // Righe dati
    ..x-labels.enumerate().map(((i, sprint)) => (
      sprint,
      fmt(values-pv.at(i)),
      fmt(values-ev.at(i)),
      fmt(values-ac.at(i)),
    )).flatten()
  ),
  caption: [Valori di PV, EV e AC accumulati per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#grafico-multi-linea(
  (
    x-labels: x-labels,
    PV: values-pv,
    EV: values-ev,
    AC: values-ac,
    series-names: ("PV", "EV", "AC"),
    show-labels: true,
    label-size: 7pt,
    grid-opacity: 10%,
  ),
  "Andamento Metriche PV, EV e AC",
  y-label: "Valore (€)",
  x-label: "Sprint",
  y-min: 400,
  y-max: 8000
)

Il team ha mantenuto un ritmo di avanzamento generalmente coerente con la pianificazione, con EV e PV che si sono mantenuti molto vicini nel corso del progetto. Tuttavia l'AC ha superato costantemente entrambi fin dai primi sprint, evidenziando una tendenza strutturale a spendere più di quanto pianificato.\ Lo scostamento complessivo è attribuibile alla natura del progetto: trattandosi della prima esperienza del team con un progetto di questa tipologia, le stime iniziali delle ore necessarie per ciascun ruolo hanno risentito della mancanza di riferimenti storici. Le cause e le contromisure adottate sono documentate nel #link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_Progetto.pdf")[Piano di Progetto].