#let tabellaRequisiti(header1: str, header2: str, contenuto) = {
  let headerBackgroundColor = rgb("#bebebe")
  let headerTextColor = luma(0%)
  let BodyBackgroundColor1 = rgb("#ffffff")
  let BodyBackgroundColor2 = rgb("#e7e7e7")
  let bordoPiatto = 1pt + black


  show table.cell.where(y: 0): body => {
    set align(center)
    set text(fill: headerTextColor)
    [*#body*]
  }

  set table(
    fill: (x, y) => if y <= 0 {
      headerBackgroundColor
    } else {
      if calc.odd(y) {
        BodyBackgroundColor1
      } else {
        BodyBackgroundColor2
      }
    },
  )
  set align(center)
  table(
    columns: (auto, auto),
    stroke: bordoPiatto,
    table.header([#header1], [#header2]),
    ..contenuto,
  )
}