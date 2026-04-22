#let design-pattern-presenter(
  pattern-name:str,
  depth:3,
  descrizione:none,
  motivazione:none,
  utilizzo:none,
)=[
  #heading(pattern-name, depth: depth)
  
  #if descrizione!=none [
    #strong("Descrizione del pattern")
    #descrizione
  ]
  
  #if motivazione!=none [
    #strong("Motivazioni dell’utilizzo del pattern")
    #motivazione
  ]
  
  #if descrizione!=none [
    #strong("Utilizzo del pattern nel progetto")
    #utilizzo
  ]
]