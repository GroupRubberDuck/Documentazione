#import "/src/config.typ"

#let utilityTable(colore: rgb("#dddfe0"), header: (), columns: 1fr, caption: none, rows) = {
  set table(
    fill: (_, y) => if calc.odd(y) { colore },
  )
  show table.cell.where(y: 0): strong
  let t = table(
    columns: (columns),
    table.header(..header),
    ..rows.map(m => m.slice(0)).flatten(),
  )
  if caption != none {
    figure(kind: table, caption: caption, t)
  } else {
    t
  }
}

#let getCode(prefisso: "", contatore: counter) = {
  prefisso + context contatore.display()
  contatore.step()
}