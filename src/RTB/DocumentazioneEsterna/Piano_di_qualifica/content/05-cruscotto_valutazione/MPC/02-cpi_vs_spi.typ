#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea


// Grafico 3 — CPI + SPI con soglia 1
#let data-cpi = csv("../../../data/MPC/05-cost_performance_index.csv").slice(1)
#let data-spi = csv("../../../data/MPC/04-schedule_performance_index.csv").slice(1)
#let x-labels = data-cpi.map(row => row.at(0))
#let values-cpi = data-cpi.map(row => float(row.at(1)))
#let values-spi = data-spi.map(row => float(row.at(1)))
#let threshold = data-cpi.map(row => 1.0)

#grafico-multi-linea(
  (
    x-labels: x-labels,
    CPI: values-cpi,
    SPI: values-spi,
    Soglia: threshold,
    series-names: ("CPI", "SPI", "Soglia"),
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


CPI e SPI si mantengono stabili e molto vicini tra loro per tutti e sei gli sprint,
oscillando tra 0.96 e 0.98. Questo conferma che il team ha lavorato in modo consistente
sia in termini di schedule che di costi, senza peggioramenti significativi nel tempo.
Il calo nello Sprint 4 è riconducibile alla sessione esami, mentre la ripresa
nello sprint 5 evidenzia un recupero. La soglia ottimale di 1
non viene raggiunta, ma lo scostamento è contenuto e stabile. Le cause sono
documentate nel
#link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_Progetto.pdf")[Piano di Progetto].