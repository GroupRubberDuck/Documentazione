//Tabella Rischi Tecnologi
#let tabellaRischiTecnologici(
  codice: str,
  nome: str,
  tipo: str,
  descrizione: content,
  prevenzione: str,
  mitigazione: content,
  frequenza: str,
  pericolo: str,
) = {
  box(width: 100%, height: auto, stroke: black)[
    #block(fill: luma(100%), inset: 8pt, width: 100%)[
      // #lorem(30)
      #block(
  stroke: 1pt + black,
  width: 100%,
  inset: 8pt,
  outset: 8pt,
  fill: rgb("#b1c8db")
)[
  #align(center)[*#codice - #nome*]
]
      #show table.cell: it => {
        if it.x == 0 {
          strong(it)
        } else {
          it
        }
      }
      #table(
        columns: (auto, 1fr),
        fill: (_, y) => if calc.odd(y) { rgb("#eaeff3") },
      )[Tipo di rischio][#tipo][Descrizione][#descrizione][Prevenzione][#prevenzione][Mitigazione][#mitigazione][Frequenza/Probabilità \ di avvenimento][#frequenza][Pericolosità][#pericolo]
    ]
  ]
}

////Tabella Rischi Personali 
#let tabellaRischiPersonali(
  codice: str,
  nome: str,
  tipo: str,
  descrizione: content,
  prevenzione: str,
  mitigazione: content,
  frequenza: str,
  pericolo: str,
) = {
  box(width: 100%, height: auto, stroke: black)[
    #block(fill: luma(100%), inset: 8pt, width: 100%)[
      // #lorem(30)
      #block(
  stroke: 1pt + black,
  width: 100%,
  inset: 8pt,
  outset: 8pt,
  fill:rgb("#fad49b")
)[
  #align(center)[*#codice - #nome*]
]
      #show table.cell: it => {
        if it.x == 0 {
          strong(it)
        } else {
          it
        }
      }
      #table(
        columns: (auto, 1fr),
        fill: (_, y) => if calc.odd(y) {  rgb("#fff3e0") },
      )[Tipo di rischio][#tipo][Descrizione][#descrizione][Prevenzione][#prevenzione][Mitigazione][#mitigazione][Frequenza/Probabilità \ di avvenimento][#frequenza][Pericolosità][#pericolo]
    ]
  ]
}

////Tabella Rischi Organizzativi
#let tabellaRischiOrganizzativi(
  codice: str,
  nome: str,
  tipo: str,
  descrizione: content,
  prevenzione: str,
  mitigazione: content,
  frequenza: str,
  pericolo: str,
) = {
  box(width: 100%, height: auto, stroke: black)[
    #block(fill: luma(100%), inset: 8pt, width: 100%)[
      // #lorem(30)
      #block(
  stroke: 1pt + black,
  width: 100%,
  inset: 8pt,
  outset: 8pt,
  fill:rgb("#e1bee7") 
)[
  #align(center)[*#codice - #nome*]
]
      #show table.cell: it => {
        if it.x == 0 {
          strong(it)
        } else {
          it
        }
      }
      #table(
        columns: (auto, 1fr),
        fill: (_, y) => if calc.odd(y) {  rgb("#f3e5f5") },
      )[Tipo di rischio][#tipo][Descrizione][#descrizione][Prevenzione][#prevenzione][Mitigazione][#mitigazione][Frequenza/Probabilità \ di avvenimento][#frequenza][Pericolosità][#pericolo]
    ]
  ]
}
