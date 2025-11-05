#let statusTab(
  versione: "",
  stato: "",
  autori: ("", ""),
  revisori:("-",),
  validatori: ("-",),
  uso: "",
  destinatari: ("", ""),
  colore: rgb("#dddfe0"),
) = {
  set table(
    fill: (_, y) => if calc.odd(y) { colore },
  )

  show table.cell.where(x: 0): strong

  table(
    columns: (2fr, 6fr),
    [Stato], [#stato],
    [Versione], [#versione],
    [Autori],
    [
      #for a in autori {
        a
        [\ ]
      }
    ],
    [Revisori],
    [
      #for a in revisori {
        a
        [\ ]
      }
    ],
    [Validatori],
    [
      #for a in validatori {
        a
        [\ ]
      }
    ],

    [Uso], [#uso],
    [Destinatari],
    [
      #for a in destinatari {
        a
        [\ ]
      }
    ],
  )
}

// #statusTab(
//   versione: "0.1",
//   stato: "In lavorazione",
//   autori: ("Davide Lorenzon", "Aldo Bettega"),
//   verificatori: "",
//   uso: "interno",
// )
