#let tabellaMetriche(metriche, titolo) = {
  figure(
    box(width: 100%, stroke: black)[
      #table(
        columns: (1fr, 1.2fr, 1fr, 1fr),
        fill: (_, y) => if calc.odd(y) { rgb("#eaeff3") },

        [*Codice*], [*Metrica*], [*Valore accettabile*], [*Valore ottimo*],

        ..for m in metriche {
          ([#m.codice], [#m.nome], [#m.accettabile], [#m.preferibile])
        }
      )
    ],
    caption: titolo,
    kind: table,
    supplement: [Tabella]
  )
}