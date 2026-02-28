#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-co = csv("../../../data/MPC/12-correttezza_ortografica.csv").slice(1)

#let values-co = data-co.map(row => float(row.at(1)))

// Soglia ottimale (TCPI = 1)
#let threshold = data-co.map(row => 1.0)

// Estrazione etichette
#let x-labels = data-co.map(row => row.at(0))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    co: values-co,
    Soglia: threshold,
    series-names: ("co",),
    show-labels: true,
    label-size: 6pt,
    grid-opacity: 20%,
    decimal-places: 4,
  ),
  "Andamento Correttezza ortografica",
  y-label: "Errori",
  x-label: "Sprint",
  y-min: 0,
  y-max: calc.max(..values-co),
)

Il team ha introdotto il monitoraggio della correttezza ortografica a partire dallo
Sprint 3, in risposta a una criticità emersa nelle revisioni della documentazione:
la verifica grammaticale era stata identificata come area di miglioramento. \ 
Il grafico mostra un trend positivo: gli errori scendono da 64 nello Sprint 3 a 55
nello Sprint 4, evidenziando un miglioramento concreto grazie all'adozione di processi
di verifica più sistematici. \
Il dato è parziale (solo due sprint) poiché la metrica
è stata introdotta in corso d'opera; il monitoraggio continuerà nelle fasi successive.