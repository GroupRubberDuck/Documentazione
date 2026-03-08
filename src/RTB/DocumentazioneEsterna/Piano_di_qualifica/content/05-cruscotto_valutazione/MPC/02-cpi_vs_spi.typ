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
  y-min: 0.5,
  y-max: 1.2,
)


CPI e SPI si mantengono vicini a 1 nei primi tre sprint, con un lieve peggioramento nello Sprint 4: SPI scende a 0.958 a causa della sessione esami che ha ridotto la disponibilità del team, mentre CPI cala progressivamente per l'accumulo di costi superiori alle stime. Nello Sprint 5 entrambi gli indici si stabilizzano, con SPI che si assesta intorno a 0.98 e CPI che rimane costante rispetto allo sprint precedente, segnale che il ritmo di lavoro del team si è normalizzato. La soglia ottimale non viene mai raggiunta, confermando lo scostamento strutturale già evidenziato nel grafico PV/EV/AC, e documentato nel  #link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_Progetto.pdf")[Piano di Progetto].