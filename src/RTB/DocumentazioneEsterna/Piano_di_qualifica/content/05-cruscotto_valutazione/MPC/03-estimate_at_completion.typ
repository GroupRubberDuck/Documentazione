#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati EAC
#let data-eac = csv("../../../data/MPC/06-estimate_at_completion.csv").slice(1)
#let values-eac = data-eac.map(row => float(row.at(1)))

// Estrazione etichette
#let x-labels = data-eac.map(row => row.at(0))

// Valore BAC costante
#let bac-value = 11610
#let values-bac = x-labels.map(_ => float(bac-value))


#let threshold-eac-high = (11610 * 1.10,) * x-labels.len()
#let threshold-eac-low  = (11610 * 0.90,) * x-labels.len()

#grafico-multi-linea(
  (
    x-labels: x-labels,
    EAC: values-eac,
    BAC: values-bac,
    SogliaMax: threshold-eac-high,
    series-names: ("EAC", "BAC", "SogliaMax"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Stima al Completamento (EAC)",
  y-label: "Valore (€)",
  x-label: "Sprint",
  y-min: 9000,
  y-max: 15000,
)

L'EAC supera il BAC (11610€) per tutti gli sprint, con oscillazioni legate all'andamento
di CPI e SPI nel corso del progetto. Lo sforamento proiettato è da ricondurre
principalmente a imprecisioni nelle stime iniziali delle ore per ruolo. Il consuntivo
effettivo resta sotto il BAC, come documentato nel
#link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_Progetto.pdf")[Piano di Progetto]
e nella sezione @budget-progress-bar.