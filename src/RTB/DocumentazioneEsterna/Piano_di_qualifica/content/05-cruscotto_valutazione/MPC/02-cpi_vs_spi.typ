#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea


// Grafico 3 — CPI + SPI con soglia 1
#let data-cpi = csv("../../../data/MPC/05-cost_performance_index.csv").slice(1)
#let data-spi = csv("../../../data/MPC/04-schedule_performance_index.csv").slice(1)
#let x-labels = data-cpi.map(row => row.at(0))
#let values-cpi = data-cpi.map(row => float(row.at(1)))
#let values-spi = data-spi.map(row => float(row.at(1)))
#let threshold = data-cpi.map(row => 1.0)
#let threshold-ottimo = data-cpi.map(row => 1.0)
#let threshold-accettabile = data-cpi.map(row => 0.9)

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
)


CPI e SPI si mantengono stabili e vicini tra loro per tutti gli sprint, con valori
inferiori alla soglia ottimale ma contenuti. 
Il calo dello Sprint 4 è riconducibile alla sessione esami. \ Il team dovrà migliorare
le stime iniziali per avvicinarsi alla soglia ottimale nei prossimi sprint. Le cause
degli scostamenti sono documentate nel
#link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_Progetto.pdf")[Piano di Progetto].