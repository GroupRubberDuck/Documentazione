// Issue per Sprint — grafico a barre raggruppate nativo Typst
#let data-issue = csv("../../../data/MPC/16-issue_per_sprint.csv").slice(1)

#let sprint-labels = data-issue.map(row => row.at(0).replace("Sprint ", "S"))
#let values-totali = data-issue.map(row => float(row.at(1)))
#let values-comp   = data-issue.map(row => float(row.at(2)))
#let values-corr   = data-issue.map(row => float(row.at(3)))

#let max-val     = calc.max(..values-totali)
#let chart-h     = 160pt   // altezza asse Y
#let bar-w       = 10pt    // larghezza singola barra
#let bar-gap     = 3pt     // spazio tra barre dello stesso gruppo
#let group-gap   = 12pt    // spazio tra gruppi (sprint)
#let group-w     = bar-w * 3 + bar-gap * 2
#let n           = sprint-labels.len()
#let total-w     = group-w * n + group-gap * (n - 1) + 30pt

#let colore-totali = rgb("#3498db")
#let colore-comp   = rgb("#2ecc71")
#let colore-corr   = rgb("#e74c3c")

#let bar-h(val) = if max-val > 0 { val / max-val * chart-h } else { 0pt }

// Titolo
#align(center, text(size: 11pt, weight: "bold")[Issue per Sprint])
#v(6pt)

// Legenda
#align(center)[
  #grid(
    columns: (auto, auto, auto, auto, auto, auto),
    column-gutter: 6pt,
    block(width: 10pt, height: 8pt, fill: colore-totali, radius: 2pt)[],
    text(size: 8pt)[Totali],
    h(6pt),
    block(width: 10pt, height: 8pt, fill: colore-comp, radius: 2pt)[],
    text(size: 8pt)[Completate],
    h(6pt),
    block(width: 10pt, height: 8pt, fill: colore-corr, radius: 2pt)[],
    text(size: 8pt)[Correttive],
  )
]
#v(8pt)

// Grafico
#align(center)[
  #block(width: total-w + 10pt)[
    // Area barre
    #block(width: total-w, height: chart-h, stroke: (bottom: 1pt + luma(180), left: 1pt + luma(180)))[
      #place(top + left)[
        #grid(
          columns: range(n).map(_ => group-w + group-gap).slice(0, n - 1) + (group-w,),
          ..range(n).map(idx => {
            let t = values-totali.at(idx)
            let c = values-comp.at(idx)
            let r = values-corr.at(idx)
            block(width: group-w, height: chart-h)[
              #place(bottom + left, dy: 0pt)[
                #stack(dir: ltr, spacing: bar-gap,
                  // Barra Totali
                  block(width: bar-w, height: bar-h(t), fill: colore-totali, radius: (top-left: 2pt, top-right: 2pt)),
                  // Barra Completate
                  block(width: bar-w, height: bar-h(c), fill: colore-comp,   radius: (top-left: 2pt, top-right: 2pt)),
                  // Barra Correttive
                  block(width: bar-w, height: bar-h(r), fill: colore-corr,   radius: (top-left: 2pt, top-right: 2pt)),
                )
              ]
            ]
          })
        )
      ]
    ]
    // Etichette X
    #block(width: total-w)[
      #grid(
        columns: range(n).map(_ => group-w + group-gap).slice(0, n - 1) + (group-w,),
        ..range(n).map(idx =>
          align(center, text(size: 7pt)[#sprint-labels.at(idx)])
        )
      )
    ]
  ]
]
#v(4pt)
#align(center, text(size: 8pt, fill: luma(40%))[Sprint])
#v(8pt)

Il volume di issue decresce progressivamente dalla fase iniziale, più intensa per la definizione dell'infrastruttura, verso gli sprint successivi. La presenza di issue correttive in ogni sprint indica che parte del lavoro ha richiesto revisioni successive, segnale di una qualità non sempre raggiunta alla prima iterazione. Tuttavia il gruppo porta generalmente a termine le issue assegnate entro il sprint di riferimento.
