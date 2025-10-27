#import "/src/config.typ"



#let utilityTable(colore:rgb("#9ea8aa"),col1:"",col2:"",col3:"", rows,) = {
  set table(
  fill: (_, y) => if calc.odd(y) { colore } )


  show table.cell.where(y: 0): strong

  table(
    columns: (1fr,1fr,3fr),
    table.header[#col1][#col2][#col3],
    ..rows.map(m => m.slice(0)).flatten(),
    
  )

}



#let getCode(prefisso:"",contatore:counter)={
  prefisso+context contatore.display()
  contatore.step()
}