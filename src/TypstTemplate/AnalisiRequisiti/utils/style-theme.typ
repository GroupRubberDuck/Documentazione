#let header-color = rgb("#008080b0")

#let req-table-style=(
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },
)