#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": plot
#import "csv-parser.typ": parse-csv-to-columns
#import "color-selection-maker.typ": get-gradient-colors
#import "_render-trend.typ"


#let grafico-multi-linea(
  data,
  title,
  y-label: "",
  x-label: "",
  target: none,
  series-colors: none,
  series-thickness: none,
  marker-size: 0.15,
  line-thickness: 2pt,
  ..plot-options,
) = {
  // Palette colori: personalizzata o automatica
  let palette = if series-colors != none {
    series-colors
  } else {
    (
      rgb("#1a73e8"),  // blu
      rgb("#e8541a"),  // arancione
      rgb("#2ecc71"),  // verde
      rgb("#9b59b6"),  // viola
      rgb("#e74c3c"),  // rosso
      rgb("#f39c12"),  // giallo
      rgb("#1abc9c"),  // turchese
      rgb("#34495e"),  // grigio scuro
    )
  }

  figure(
    caption: title,
    cetz.canvas({
      plot.plot(
        size: (13, 6),
        x-tick-step: 1,
        x-max: data.x-labels.len(),
        y-label: y-label,
        x-label: x-label,
        x-grid: "major",
        y-grid: "both",
        legend: "east",
        legend-style: (
          fill: white.transparentize(10%),
          stroke: luma(180),
          radius: 2pt,
          padding: 0.5em,
        ),
        x-format: i => {
          let label = data.x-labels.at(int(i), default: "")
          label
        },
        ..plot-options.named(),
        {
          for (i, name) in data.series-names.enumerate() {
            let series-data = data.at(name)
            let xy = range(series-data.len()).zip(series-data)
            let color = palette.at(calc.rem(i, palette.len()))
            let thickness = if series-thickness != none {
              series-thickness.at(i, default: line-thickness)
            } else {
              line-thickness
            }

            plot.add(
              xy,
              label: name,
              style: (
                stroke: thickness + color,
                fill: color.lighten(80%),
              ),
              mark: "o",
              mark-size: marker-size,
              mark-style: (
                fill: color.lighten(50%),
                stroke: thickness + color,
              ),
            )
          }

          if target != none {
            let t-colors = (
              rgb("#e74c3c"),
              rgb("#27ae60"),
              rgb("#f39c12"),
              rgb("#8e44ad"),
            )
            for (j, key) in target.keys().enumerate() {
              plot.add-hline(
                target.at(key),
                style: (
                  stroke: (
                    paint: t-colors.at(calc.rem(j, t-colors.len())),
                    dash: "dashed",
                    thickness: 1.5pt,
                  ),
                ),
                label: key,
              )
            }
          }
        },
      )
    }),
  )
}
