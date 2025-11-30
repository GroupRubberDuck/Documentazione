
#let tabellaAtt(titolo:str,attivita:array)={
let headerBackgroundColor=luma(20%)
let headerTextColor=luma(100%)
let BodyTextColor=luma(0%)
let BodyBackgroundColor1=luma(80%)
let BodyBackgroundColor2=luma(60%)


show table.cell.where(y:0) :body =>{
  set text(fill:headerTextColor)
  [*#body*]
}
show table.cell.where(y:1) :body =>{
  set text(fill:headerTextColor)
  [*#body*]
}

set table(
  fill: (x, y) =>
    if y <= 1{
      headerBackgroundColor
    }
    else {
      if calc.odd(y){
        BodyBackgroundColor1
      }
      else{
        BodyBackgroundColor2
        
      }
    }

)
  table(
    columns: (1fr, 1fr,1fr),
    table.header(table.cell(colspan: 3,align: center,titolo),    [Scomposizione],
    [Periodo di \ svolgimento],
    [Stato]),
    ..attivita
  )
}