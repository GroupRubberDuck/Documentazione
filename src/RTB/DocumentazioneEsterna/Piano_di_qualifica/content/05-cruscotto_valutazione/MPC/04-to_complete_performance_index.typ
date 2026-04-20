#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-tcpi = csv("../../../data/MPC/07-to_complete_performance_index.csv").slice(1)

#let x-labels   = data-tcpi.map(row => row.at(0))
#let values-tcpi = data-tcpi.map(row => float(row.at(1)))

// Soglia ottimale (TCPI = 1)
#let threshold = data-tcpi.map(row => 1.0)

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

// Giudizio TCPI
#let giudizio-tcpi(v) = {
  if v <= 1.0 {
    "Ottimo — rientro nel BAC raggiungibile"
  } else if v <= 1.05 {
    "Accettabile — lieve sforzo aggiuntivo"
  } else if v <= 1.10 {
    "Attenzione — efficienza superiore richiesta"
  } else {
    "Critico — rientro nel BAC a rischio"
  }
}

// ── Grafico ───────────────────────────────────────────────────────────────────
#grafico-multi-linea(
  (
    x-labels: x-labels,
    TCPI: values-tcpi,
    Soglia: threshold,
    series-names: ("TCPI", "Soglia"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Andamento To Complete Performance Index (TCPI)",
  y-label: "Indice",
  x-label: "Sprint",
  y-min: 0.8,
  y-max: 1.4,
  series-colors: (
    rgb("#1a73e8"),      // TCPI — blu
    rgb(180, 180, 180),  // Soglia — grigio tenue
  ),
  series-thickness: (2pt, 0.8pt),
)

Il TCPI si mantiene costantemente sopra la soglia ottimale di 1.0 per tutti
gli sprint, con una leggera crescita. Sebbene lo scostamento sembri contenuto,
un TCPI > 1 indica che il team dovrà sostenere un'efficienza superiore a quella
media dimostrata finora per rientrare nel BAC.
