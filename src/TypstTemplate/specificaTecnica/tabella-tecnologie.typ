


#let header-color = rgb("#008080") 

#let header-color = rgb("#008080")

#let tabella-tecnologie(
  table-header: ([Nome], [Versione], [Descrizione]),
  columns: (auto, auto, 1fr),
  caption: content,
  cells: (:)
) = {
  
  let style-settings = (
    stroke: (x, y) => (
      bottom: 0.5pt + rgb("#e2e8f0"), 
      top: none,
      left: none,
      right: none
    ),
    inset: (x: 10pt, y: 10pt),
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },
  )

  let display-cells = cells.pairs().map(
    ((chiave, valore)) => {
      (
        table.cell(
          colspan: columns.len(),
          fill: rgb("#f8fafc"), 
          stroke: (bottom: 1pt + header-color.lighten(40%)), 
          align: left,
          [*#chiave*] 
        ),
      ) + valore
    }
  )

  figure(caption: caption)[
    #block(
      stroke: 1.5pt + black, 
      radius: 2pt,
      clip: true,                   
    )[
      #table(
        ..style-settings,
        columns: columns, 
        
        table.header(..table-header.map(h => text(fill: white, weight: "bold", h))),

        ..(display-cells.flatten())
      )
    ]
  ]
}