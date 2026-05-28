#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

#let data-eff = csv("../../../data/MPD/07-efficienza.csv").slice(1)

#let x-labels   = data-eff.map(row => row.at(0).replace("Sprint ", "S"))
#let resp-time  = data-eff.map(row => float(row.at(1)))
#let cpu-util   = data-eff.map(row => float(row.at(2)))
#let ram-util   = data-eff.map(row => float(row.at(3)))

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

    table.header(
      text(fill: white, weight: "bold")[Sprint],
      text(fill: white, weight: "bold")[Response Time (MPD-09)],
      text(fill: white, weight: "bold")[CPU Util. (MPD-10)],
      text(fill: white, weight: "bold")[RAM Util. (MPD-11)],
    ),

    ..data-eff.map(row => (
      row.at(0),
      fmt(float(row.at(1))) + " s",
      fmt(float(row.at(2))) + "%",
      fmt(float(row.at(3))) + " GB",
    )).flatten()
  ),
  caption: [Andamento delle metriche di efficienza del prodotto per sprint],
)

// ── Grafico ───────────────────────────────────────────────────────────────────
#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels,
      "CPU Util. (%)": cpu-util,
      "Response Time (s)": resp-time,
      "RAM Util. (GB)": ram-util,
      series-names: ("CPU Util. (%)", "Response Time (s)", "RAM Util. (GB)"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 10%,
      x-tick-angle: -45deg,
      x-padding: 0,
    ),
    "Andamento Efficienza: CPU, RAM e Response Time",
    y-label: "Valori Misurati",
    x-label: "Sprint",
    y-min: 0,
    y-max: 20,
  )
]

// ── Descrizione ───────────────────────────────────────────────────────────────
Le metriche di efficienza confermano l'ottima stabilità del sistema sotto carico. Le misurazioni sono state effettuate in ambiente Docker: l'architettura a container, essendo isolata e priva dell'overhead di un sistema operativo completo, giustifica il ridottissimo consumo di RAM, stabilizzatosi a soli *0,77 GB*. 

Tutti i parametri rientrano ampiamente nelle soglie ottimali previste. Nello Sprint 14 spicca l'ottimizzazione della CPU, scesa all'*11,00%*, mentre il Response Time si mantiene costantemente su valori di eccellenza, garantendo un'esecuzione fluida e priva di colli di bottiglia.