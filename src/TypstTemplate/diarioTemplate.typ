#import "/src/config.typ": *
#import "@preview/polylux:0.4.0": *

#let separator-line = stroke(
  thickness: 2pt,
  paint: rgb(0, 28, 41),
  cap: "round",
)

#let slides(
  numero: 1,
  data: none,
  doc,
) = {
  set text(size: 20pt)
  
  // FRONT PAGE (senza header/footer)
  page(
    paper: "presentation-16-9",
    margin: 2cm,
    header: none,
    footer: none,
  )[
    #set align(horizon)
   
    #text(size: 2em, weight: "bold")[
      #toolbox.side-by-side(columns: (auto, 1fr, auto))[
        #image(logo_rd, height: 4em)
      ][
        Diario di Bordo #numero
      ][
        #image(logo_unipd, height: 3em)
      ]
    ]
    #line(stroke: separator-line, length: 100%)

    RubberDuck - Gruppo 14
    \ \
    #data
  ]
  
  // Resto slides (con header/footer)
  set page(
    paper: "presentation-16-9",
    margin: 2cm,
    footer: context [
      #set text(size: .6em)
      #set align(horizon)
      RubberDuck - Gruppo 14, #data #h(1fr) #counter(page).display()
    ],
    header: box(stroke: (bottom: separator-line), inset: 8pt)[
      #set text(size: .6em)
      #set align(horizon)
      #h(1fr) 
      Diario di Bordo #numero
    ],
  )
  
  show heading.where(level: 1): it => {
  pagebreak()
  block[
    #text(size: 30pt, weight: "bold")[#it.body]
    #v(1cm)
  ]
}
  
  doc
}


/*
Esempio di utilizzo:
#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 1,
  data: "27-10-2025",
)

= Prima Slide
Contenuto...

= Seconda Slide
Contenuto...

*/