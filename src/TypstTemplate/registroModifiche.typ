#import "/src/config.typ":*



#let registroModifiche(colore:rgb("#dddfe0"), rows) = {
  rows=rows.rev()
  set table(
  fill: (_, y) => if calc.odd(y) { colore } )

  let col_count = 5
  let row_count =rows.len()/col_count

  show table.cell.where(y: 0): strong

  table(
    columns: (auto, auto, 1fr, auto, auto),
    table.header[Versione][Data][Descrizione][Autore][Revisore],
    ..rows.map(m => m.slice(0)).flatten(),
    
  )
pagebreak()
}

// esempio d'uso
// #let colore=rgb("#646869")
// #registroModifiche(colore:colore,
//   (
//   ("0.1", "12/12/2025", "prima stesura", "davide lorenzon", "???????"),
//   ("0.1", "12/12/2025", "prima stesura", "davide lorenzon", "???????"),
//   ("0.1", "12/12/2025", "prima stesura", "davide lorenzon", "???????"),
//   ("0.1", "12/12/2025", "prima stesura", "davide lorenzon", "???????")
//   ))