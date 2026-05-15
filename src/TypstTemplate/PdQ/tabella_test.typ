
#let format-id(prefix, index, padding) = {
  let num-str = str(index + 1) 
  
  let zeri-mancanti = calc.max(0, padding - num-str.len())
  
  return prefix + ("0" * zeri-mancanti) + num-str
}

#let test-table(prefix:"", dati-test, num-padding: 2) = {
  

  let righe = dati-test.enumerate().map(pair => {
    let (i, test) = pair 
    
    let auto-id = format-id(prefix, i, num-padding)
    
    return (
      auto-id,
      test.descrizione,       
      test.esito      
    )
  })

  table(
        columns: (auto, 4fr, 1fr),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { rgb("#008080b0") } else { none },

    
    table.header([*ID*], [*Descrizione*], [*Esito*]),
    
    ..righe.flatten()
  )
}