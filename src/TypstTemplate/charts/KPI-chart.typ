#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": plot
#import "csv-parser.typ": parse-csv-to-columns
#import "color-selection-maker.typ": get-gradient-colors
#import "_render-trend.typ"



// Worker 2: Disegna grafici multi-linea (es. Gulpease documenti diversi) con possibilità di aggiungere threshold
#let _render-multi(
  data,
  title,
  y-label: "",
  x-label: "",
  target: none,
  ..plot-options,
) = {
  // Palette colori ciclica
  let palette = get-gradient-colors(n: data.series-names.len(), color-map: color.map.viridis)
  cetz.canvas({
    plot.plot(
      size: (10, 6),
      title: title,
      x-tick-step: 1,
      x-max: data.x-labels.len(),
      // y-tick-step: 20,
      // y-minor-tick-step: 5,
      axis-style: "school-book",
      y-label: y-label,
      x-label: x-label,
      x-grid: "major",
      y-grid: "both",
      legend:"east",
      legend-style: (
        fill: white.transparentize(10%),
        stroke: gray,
        radius:2pt,
        padding:0.5em,
      
      ),
      x-format: i => data.x-labels.at(int(i), default: ""),
      ..plot-options.named(),
      {
        for (i, name) in data.series-names.enumerate() {
          // BUG FIX: Usiamo la lunghezza dei DATI, non delle SERIE
          let series-data = data.at(name)
          let xy = range(series-data.len()).zip(series-data)

          let color = palette.at(calc.rem(i, palette.len()))

          plot.add(xy, label: name, style: (stroke: 2pt + color), mark: "o")
        }


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



// Funzione Pubblica
#let kpi-chart(
  file-path,
  type: "trend", // Default: grafico semplice
  title: "",
  x-label: "",
  y-label: "",
  ..args, // Cattura tutti gli altri argomenti (es. target: 80)
) = {
  // 1. Fase di Parsing (Comune a tutti)
  let data = parse-csv-to-columns(file-path)

  // 2. Fase di Dispatch (Switch Logic)
  if type == "trend" {
    // Passiamo 'args.named()' per scompattare target, colori extra, etc.
    _render-trend(data, title, y-label: y-label, ..args.named())
  } else if type == "multi" {
    _render-multi(data, title, y-label: y-label, ..args.named())
  } else {
    // Gestione Errori difensiva
    text(fill: red, weight: "bold")[
      ERRORE: Tipo grafico '#type' non supportato per il file #file-path
    ]
  }
}








