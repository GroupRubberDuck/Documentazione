#import "/src/config.typ":template_dir,he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati CPI e SPI
#let data-cpi = csv("../../../data/MPC/05-cost_performance_index.csv").slice(1)
#let data-spi = csv("../../../data/MPC/04-schedule_performance_index.csv").slice(1)

#let values-cpi = data-cpi.map(row => float(row.at(1)))
#let values-spi = data-spi.map(row => float(row.at(1)))


// Estrazione etichette

#let x-labels = data-cpi.map(row => row.at(0))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    CPI: values-cpi,
    SPI: values-spi,
    series-names: ("CPI", "SPI"),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
  ),
  "Indici di Performance CPI e SPI",
  y-label: "Indice",
  x-label: "Sprint",
)

il CPI misura quant'è produttivo ogni euro speso (EV/AC), l'SPI quanto si è in linea con la schedulazione (EV/PV). Servono a capire se si sta lavorando in modo efficiente e nei tempi previsti. Ottimale: entrambi ≥ 1.