#import "@preview/polylux:0.4.0": *

#show link: set text(blue)
#set text(font: "Montserrat", size: 20pt)

#let today = datetime(year: 2025, month: 10, day: 27)
#let title = [Diario di Bordo 1]

#let separator-line = stroke(
  thickness: 2pt,
  paint: rgb(0, 28, 41),
  cap: "round",
)

#set page(
  paper: "presentation-16-9",
  margin: 2cm,
  footer: [
    #set text(size: .6em)
    #set align(horizon)

    RubberDuck - Gruppo 14, #today.display() #h(1fr) #toolbox.slide-number
  ],
  header: box(stroke: (bottom: separator-line), inset: 8pt)[
    #set text(size: .6em)
    #set align(horizon)
    #h(1fr)
    #title
  ],
)

#show heading: set block(below: 1em)

#slide[
  #set page(footer: none, header: none)
  #set align(horizon)
  #text(size: 2em, weight: "bold")[
    #toolbox.side-by-side(columns: (auto, 1fr, auto))[#image("../Images/logoRD.jpg", height: 4em)][
      #title
    ][
      #image("../Images/logo_Unipd.png", height: 3em)
    ]
  ]

  #line(stroke: separator-line, length: 100%)

  RubberDuck - Gruppo 14
  \ \
  Lunedì #today.display("[day]/[month]/[year]")
]

#slide[
  = Attività completate
  #set list(marker: image("../Images/check.png", width: 0.8em))
  - Creazione di nome e logo
  - Scelta dei canali di comunicazione (whatsapp + discord)
  - Creazione della mail
  - Scelto come strumento di documentazione Typst
  - Creazione template per documenti Typst
  - Creazione della repo github
  - Implementata su github la compilazione automatica dei typst doc
  - Incontro e scrittura verbale con C8
  - Incontro e scrittura verbale con C1
  - Incontro e scrittura verbale con C7
  - Fare una project board github
]

#slide[
  = Attività da completare

  #set list(marker: image("../Images/clessidra.png", width: 0.7em))
  - Incontro e scrittura verbale con C5
  - Aggiornare il template typst
  - Lettera di presentazione
  - Valutazione di tutti i capitolati
  - Preventivo degli impegni con dichiarazione del way of working
]

#slide[
  = Difficoltà incontrate

  #set list(marker: [--])
  - Scelta dei capitolati
]

#slide[
  = Dubbi

  #set list(marker: [--])
  - Modalità di acquisizione d'appalto
  - Divisione oraria e preventivo
]
