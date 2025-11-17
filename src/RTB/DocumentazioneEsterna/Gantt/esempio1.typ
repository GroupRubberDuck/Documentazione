#import "/src/config.typ": *
#import "@preview/timeliney:0.4.0"


#set page(paper:"a4",flipped: false)
#timeliney.timeline(
  
  show-grid: true,
  {
    import timeliney: *
    // qui si definiscono i gruppi (i mesi) che poi andremo a dividere in periodi, e anche la dimansione dei gruppi
    headerline(group(([*Novembre*], 4)), group(([*Dicembre*], 4)),group(([*Gennaio*], 4)))
    // divisione in periodi
    headerline(
      group(..range(4).map(n => strong("S" + str(n + 1)))),
      group(..range(4).map(n => strong("S" + str(n + 1)))),
      group("S1","S2","S3","S4")
      // vuole in input tanti array quanti i gruppi definiti inizialmente
    )
  
    taskgroup(
      title: [*Analisi dei requisiti*],
      content: text(10pt, white)[*Avanzamento complessivo*],
      style: (stroke: 14pt + black),
      {
        // dentro task si possono scrivere l'attività , chi l'ha svolta, quanti periodi ha occupato
        task(
          "Individuazione degli user needs",
          (from: 0, to: 1, content: text(9pt)[John (25% done)]),
          style: (stroke: 13pt + gray),
        )
        task(
          "Diagrammi dei casi d'uso",
          (from: 1, to: 3, content: text(9pt)[altro nome (50% done)]),
          style: (stroke: 13pt + gray),
        )
        
        task(
          "diagrammi delle attività",
          (from: 2, to: 4, content: text(9pt)[Julia (100% done)]),
          style: (stroke: 13pt + gray),
        )
      },
    )

    taskgroup(title: [*Development*], {
      task("Create mock-ups", (2, 3), style: (stroke: 2pt + gray))
      task("Develop application", (3, 5), style: (stroke: 2pt + gray))
      task("QA", (3.5, 6), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Marketing*], {
      task("Press demos", (3.5, 7), style: (stroke: 2pt + gray))
      task("Social media advertising", (6, 7.5), style: (stroke: 2pt + gray))
    })
// così possibile fissare le milestone
    milestone(
      at: 3.75,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Conference demo*\
        Dec 2023
      ])
    )

    milestone(
      at: 6.5,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *App store launch*\
        Aug 2024
      ])
    )
  }
)