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
Il TimeEAC si mantiene generalmente allineato al pianificato, con scostamenti contenuti
riconducibili a rallentamenti puntuali come la sessione esami, seguiti da parziali recuperi
negli sprint successivi. Il dato va tuttavia letto con cautela: il completamento delle task
nei tempi previsti non riflette necessariamente la qualità del lavoro svolto. Task chiuse
parzialmente hanno generato attività correttive negli sprint successivi, come evidenziato
anche dall'andamento documentato nel #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Piano di Progetto].
#line(length: 100%, stroke: 0.5pt + luma(180))
Il TimeEAC si è mantenuto allineato alla pianificazione fino all'avvio della Product Baseline (S9). A partire da tale sprint, si è consolidato un ritardo complessivo di circa un mese rispetto al termine originale. Tale slittamento è imputabile ai debiti accumulati nelle fasi precedenti, in particolare alla curva di apprendimento tecnologico e alla sottostima dell'impegno richiesto dalle attività di verifica e analisi. L'andamento è documentato nel #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Piano di Progetto].

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
Il grafico illustra la composizione del budget nel corso del progetto. I costi effettivi (AC)
mostrano una crescita controllata e lineare, mentre il lavoro rimanente stimato (ETC) diminuisce progressivamente, mantenendo il budget totale (EAC) generalmente stabile.
Il BAC (€#str(bac-value)) è riportato come riferimento per valutare lo scostamento proiettato. 
#line(length: 100%, stroke: 0.5pt + luma(180))
Il progetto si conclude con uno slittamento temporale di un mese rispetto alla pianificazione originaria. Sotto il profilo economico, è importante evidenziare che il costo effettivo sostenuto (Actual Cost, AC) si mantiene al di sotto del budget totale pianificato (BAC di 11.610€), pur attestandosi su valori prossimi a quest'ultimo. 
Tuttavia, a partire dallo Sprint 9 (Product Baseline), l'adozione di un workflow di approvazione strutturato e l'integrazione di pipeline di Continuous Integration hanno stabilizzato l'efficienza operativa del gruppo. Gli indicatori di performance (CPI e SPI) mostrano un trend di miglioramento costante, a conferma che le azioni correttive hanno reso il ritmo di lavoro sostenibile e la qualità del codice conforme agli standard prefissati.