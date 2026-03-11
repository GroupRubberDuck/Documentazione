#import "/src/config.typ": template_dir, he, slugify

#import "/src/TypstTemplate/charts/KPI-chart.typ": grafico-multi-linea

// Caricamento dati
#let data-pv = csv("../../../data/MPC/01-planned_value.csv").slice(1)
#let data-ev = csv("../../../data/MPC/02-earned_value.csv").slice(1)
#let data-ac = csv("../../../data/MPC/03-actual_cost.csv").slice(1)

// Estrazione etichette
#let x-labels = data-pv.map(row => row.at(0))

// Estrazione valori numerici
#let values-pv = data-pv.map(row => float(row.at(1)))
#let values-ev = data-ev.map(row => float(row.at(1)))
#let values-ac = data-ac.map(row => float(row.at(1)))

#grafico-multi-linea(
  (
    x-labels: x-labels,
    PV: values-pv,
    EV: values-ev,
    AC: values-ac,
    series-names: ("PV", "EV", "AC"),
    show-labels: true,
    label-size: 7pt,
    grid-opacity: 10%,
  ),
  "Andamento Metriche PV, EV e AC",
  y-label: "Valore (€)",
  x-label: "Sprint",
  y-min: 400,
  y-max: 4000
)

Il team ha mantenuto un ritmo di avanzamento coerente con la pianificazione, con EV e PV che viaggiano molto vicini per tutti e sei gli sprint. Tuttavia l'AC supera costantemente entrambi fin dallo Sprint 1, evidenziando una tendenza strutturale a spendere più di quanto pianificato.\ Lo scostamento complessivo è attribuibile alla natura del progetto: trattandosi della prima esperienza del team con un progetto di questa tipologia, le stime iniziali delle ore necessarie per ciascun ruolo hanno risentito della mancanza di riferimenti storici. Le cause e le contromisure adottate sono documentate nel #link("https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_Progetto.pdf")[Piano di Progetto].