#import "/src/config.typ": *
#set page(
  paper: "a4",
  margin: (top: 1.5in, bottom: 1in, left: 1in, right: 1in),
)

#set text(size: 13pt)

#let logoUnipd = image(logo_unipd)
#let logoRD = image(logo_rd, width: 30%)

#let frontPage(title, date) = {
  set rect(
    inset: 0pt,
    fill: rgb("#ffffff"),
    width: 100%,
  )
  grid(
    columns: (1fr, 2fr),
    rows: auto,
    align: horizon + center,
    column-gutter: 3pt,
    row-gutter: (2%, 15%),
    stroke: none,
    rect[#logoUnipd],
    rect()[
      #align(horizon + center)[
        *Università degli Studi di Padova* \
        Laurea: Informatica \
        Corso: Ingegneria del Software \
        Anno Accademico: 2025/2026 \
      ]
    ],
    rect(width: 400%)[#logoRD],
    rect()[
      *Gruppo RubberDuck* \
      email: #link("mailto:grouprubberduck@gmail.com")[
        GroupRubberDuck\@gmail.com
      ]
    ],
    grid.cell(colspan: 2)[
      #set text(size: 20pt)
      *#title* \
      *#date.display()*
    ],
  )
  pagebreak()
  context counter(page).update(1)
}
