#import "/src/config.typ": template_dir, he, slugify
#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati EAC
#let data-eac = csv("../../../data/MPC/06-estimate_at_completion.csv").slice(1)
#let values-eac = data-eac.map(row => float(row.at(1)))

// Estrazione etichette (usiamo lo stesso formato abbreviato degli altri grafici)
#let x-labels-full = data-eac.map(row => row.at(0))
#let x-labels-short = data-eac.map(row => row.at(0).replace("Sprint ", "S"))

// Valore BAC costante
#let bac-value = 11610
#let values-bac = x-labels-full.map(_ => float(bac-value))

// Soglia di tolleranza (110% del BAC)
#let threshold-eac-high = (11610 * 1.10,) * x-labels-full.len()

#pad(x: -2cm)[
  #grafico-multi-linea(
    (
      x-labels: x-labels-short,
      EAC: values-eac,
      BAC: values-bac,
      SogliaMax: threshold-eac-high,
      series-names: ("EAC", "BAC", "SogliaMax"),
      show-labels: true,
      label-size: 6pt,
      grid-opacity: 20%,
      x-tick-angle: -45deg, // Rotazione per leggibilità
    ),
    "Stima al Completamento (EAC)",
    y-label: "Valore (€)",
    x-label: "Sprint",
    y-min: 7000,
    y-max: 18000,
    series-colors: (
      rgb("#1a73e8"),      // EAC — blu
      rgb(150, 150, 150),  // BAC — grigio
      rgb(220, 100, 100),  // SogliaMax — rosso tenue
    ),
    series-thickness: (2pt, 0.8pt, 0.8pt),
  )
]

L'EAC supera il BAC (11610€) a causa di stime iniziali imprecise, mantenendosi comunque entro la tolleranza del 110% (12771€). Il consuntivo effettivo rientra però nel budget, come dettagliato nel #link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v2.0.0.pdf")[Piano di Progetto] e in @budget-progress-bar.
#line(length: 100%, stroke: 0.5pt + luma(180))
Dallo S9 l'EAC registra un calo costante dai picchi precedenti, avvicinandosi al BAC negli sprint finali (S13--S14). Questo trend evidenzia un netto recupero del CPI e l'efficacia del team nel contenere i costi durante la fase PB.
