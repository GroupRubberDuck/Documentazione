#let bac = 11610.0
#let data-ac = csv("../../../data/MPC/03-actual_cost.csv").slice(1)
#let ac-attuale = float(data-ac.last().at(1))

#let percentuale = calc.min(ac-attuale / bac, 1.0)
#let colore = if percentuale < 0.7 { rgb("#2ecc71") } else if percentuale < 0.9 { rgb("#f39c12") } else { rgb("#e74c3c") }

#figure(
  block(width: 100%, inset: (y: 8pt))[
    #text(weight: "bold")[
      Budget consumato: #str(calc.round(ac-attuale)) € / #str(calc.round(bac)) € (#str(calc.round(percentuale * 100))%)
    ]
    #v(4pt)
    #block(width: 100%, height: 18pt, radius: 4pt, stroke: luma(180), clip: true, inset: 0pt)[
      #align(left)[
        #box(width: percentuale * 100%, height: 18pt, fill: colore)
      ]
    ]
    #v(2pt)
    #grid(
      columns: (1fr, 1fr),
      text(size: 12pt, fill: luma(0%))[0 €],
      align(right, text(size: 12pt, fill: luma(0%))[#str(calc.round(bac)) €]),
    )
    #v(2pt)
    #text(size: 12pt, fill: luma(0%))[Rimanente: #str(calc.round(bac - ac-attuale)) €]
  ],
  caption: [Budget consumato sul totale pianificato],
) <budget-progress>

Il budget consumato si riferisce al solo periodo RTB sul totale.
Il progetto completo prevede momenti successivi (PB) non ancora avviati.