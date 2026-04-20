#let header-color = rgb("#008080b0")

#let tabella-requisiti(contenuto) = {
  table(
    columns: (auto, auto, 1fr, auto),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },

    table.header(
      strong("Codice"),
      strong("Rilevanza"),
      strong("Descrizione"),
      strong("Fonti"),
    ),

    ..contenuto
  )
}

/*
ESEMPIO DI UTILIZZO
#tabella-requisiti(
  (
    // Riga 1
    "ROF1",
    "Obbligatorio",
    "L'utente deve poter inserire un'interrogazione in linguaggio naturale nel sistema.",
    underline("UC1"),
  )
)
*/