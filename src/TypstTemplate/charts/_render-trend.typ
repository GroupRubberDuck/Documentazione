#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": plot
#import "csv-parser.typ": parse-csv-to-columns
#import "color-selection-maker.typ": get-gradient-colors

// Worker 1: Disegna grafici temporali semplici (Data vs Valore + Target opzional1)

#let _render-trend(
  data,
  title,
  target: none,
  y-label: "",
  x-label: "",
  value-label: "Misurazione",
  plot-settings:(:),
  default-style-settings :( 
    style: (stroke: 2pt + blue), 
    mark: "o"
    ),


) = {
let   default-plot-settings=(
      size: (12, 6),
      title: title,
      x-tick-step: 1,
      axis-style: "school-book",
      x-grid: "major",
      y-grid: "both",
  )
let final-plot-opts = default-plot-settings + plot-settings


  cetz.canvas({
    plot.plot(
      ..final-plot-opts,
      x-max: data.x-labels.len(),
      y-label: y-label,
      x-label: x-label,
      x-format: i => data.x-labels.at(int(i), default: ""),
      {
        let main-series = data.series-names.first()

        let xy = range(data.at(main-series).len()).zip(data.at(main-series))
        
        let plot-add-style=  default-style-settings+(label: value-label)
        plot.add(xy, ..plot-add-style)
        
        if target != none {
          let colors = get-gradient-colors(n: target.keys().len())
          for key in target.keys() {
            
            plot.add-hline(
              target.at(key),
              style: (stroke: (paint: colors.pop(), dash: "dashed", thickness: 2pt)),
              label: key,
            )
          }

        }
      },

    )

  })
}