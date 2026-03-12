#let header-color = rgb("#008080b0")

#let tabella-tracciamento(header1, header2, contenuto) = {
  table(
    columns: (auto, 1fr),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },

    table.header(
      strong(header1),
      strong(header2),
    ),

    ..contenuto
  )
}
