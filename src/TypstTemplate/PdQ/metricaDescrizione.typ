#let descrizione-metrica(
  codice:str,
  nome:str,
  descrizione-breve:content,
  formula:content,
  interpretazione:content,
  come-calcolo:content,
  // serve a gestire parametri extra passati accidentalmente con lo spreading 
  ..sink
)={
  box(fill:luma(95%),inset:1em,radius:3%, stroke:1pt, width:100%)[

  #align()[#strong()[#nome]]
  #box(inset:1em)[
  

  - #strong("Codice"): #codice
  
  - #strong("Descrizione"):\ #descrizione-breve
  
  #if formula!=none{
  [- #strong("Formula"):\ #formula]
  }  
  
  #if interpretazione!=none{
  [- #strong("Interpretazione"):\ #interpretazione]
  }  
  
  #if come-calcolo!=none{
  [- #strong("Calcolo"):\ #come-calcolo]
  }
  
  ]
  ]
}