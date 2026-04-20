#let bac = 11610.0
#let data-ac = csv("../../../data/MPC/03-actual_cost.csv").slice(1)
#let ac-attuale = float(data-ac.last().at(1))

#let percentuale = calc.min(ac-attuale / bac, 1.0)
#let colore = if percentuale <= 0.70 {
  rgb("#2ecc71")
} else if percentuale <= 0.85 {
  rgb("#f39c12")
} else if percentuale <= 0.95 {
  rgb("#e67e22")
} else {
  rgb("#e74c3c")
}
#let stato = if percentuale <= 0.70 {
  "Nella norma"
} else if percentuale <= 0.85 {
  "Verso fine budget"
} else if percentuale <= 0.95 {
  "Prossimi alla soglia"
} else {
  "Attenzione critica"
}

#let dot(c) = box(
  width: 8pt, height: 8pt,
  radius: 2pt,
  fill: c,
  baseline: -1pt,
)

#figure(
  block(
    width: 100%,
    inset: (x: 14pt, y: 12pt),
    radius: 6pt,
    stroke: luma(200),
  )[
    // Titolo + badge
    #box(width: 100%)[
      #grid(
        columns: (1fr, auto),
        align(horizon + left,
          text(weight: "bold", size: 11pt)[Budget consumato ]
        ),
        align(horizon + right,
          box(
            inset: (x: 8pt, y: 3pt),
            radius: 4pt,
            fill: colore.lighten(70%),
            stroke: colore,
          )[#text(size: 9pt, fill: colore, weight: "bold")[#stato]]
        ),
      )
    ]

    #v(10pt)

    // Tre valori
    #box(width: 100%)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left, stack(dir: ttb, spacing: 2pt,
          text(size: 9pt, fill: luma(120))[Consumato],
          text(weight: "bold", size: 11pt)[#str(calc.round(ac-attuale)) €],
        )),
        align(center, stack(dir: ttb, spacing: 2pt,
          text(size: 9pt, fill: luma(120))[Percentuale],
          text(weight: "bold", size: 11pt, fill: colore)[#str(calc.round(percentuale * 100))%],
        )),
        align(right, stack(dir: ttb, spacing: 2pt,
          text(size: 9pt, fill: luma(120))[Rimanente],
          text(weight: "bold", size: 11pt)[#str(calc.round(bac - ac-attuale)) €],
        )),
      )
    ]

    #v(12pt)

    // Barra — sfondo grigio + fill verde sovrapposto
    #box(width: 100%, height: 20pt, radius: 5pt, stroke: luma(180), fill: luma(240))[
      #place(left + horizon,
        box(
          width: percentuale * 100%,
          height: 20pt,
          fill: colore,
          radius: (
            top-left: 5pt,
            bottom-left: 5pt,
            top-right: if percentuale >= 1.0 { 5pt } else { 0pt },
            bottom-right: if percentuale >= 1.0 { 5pt } else { 0pt },
          ),
        )
      )
    ]

    #v(4pt)

    // Etichette barra
    #box(width: 100%)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left,  text(size: 8pt, fill: luma(140))[0 €]),
        align(center, text(size: 8pt, fill: luma(140))[BAC: #str(calc.round(bac)) €]),
        align(right, text(size: 8pt, fill: luma(140))[100%]),
      )
    ]

    #v(12pt)

    // Legenda
    #box(width: 100%)[
      #set text(size: 7.5pt, fill: luma(80))
      #dot(rgb("#2ecc71")) #h(3pt) ≤ 70% — Nella norma
      #h(12pt)
      #dot(rgb("#f39c12")) #h(3pt) 70–85% — Verso fine budget
      #h(12pt)
      #dot(rgb("#e67e22")) #h(3pt) 85–95% — Prossimi alla soglia
      #h(12pt)
      #dot(rgb("#e74c3c")) #h(3pt) > 95% — Attenzione critica
    ]
  ],
  caption: [Budget consumato sul totale pianificato (BAC)],
) <budget-progress>

Il budget consumato si riferisce al solo periodo RTB sul totale.
Il progetto completo prevede momenti successivi (PB) non ancora avviati