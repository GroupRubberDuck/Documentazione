#import "/src/config.typ": *
#import "@preview/timeliney:0.4.0"
#show <frontPage>: set text(size:2em) 
#show <titolo>: set text(size:3em) 
#show link: body =>{
  set text(blue)
  underline(body)
} 
#set heading(numbering: "1.1)")
#align(center+ horizon)[
= Diagrammi di Gantt <titolo>
In questo documento si sintetizzano alcune linne guida utili a creare un diagramma di Gantt efficacie
]<frontPage>

#pagebreak()
#figure(
  caption:[
  Diagramma di esempio fornito sulla pagina typst universe di 
  #link("https://typst.app/universe/package/timeliney")[Timeliney]
]
)[

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group(([*2023*], 4)), group(([*2024*], 4)))
    headerline(
      group(..range(4).map(n => strong("Q" + str(n + 1)))),
      group(..range(4).map(n => strong("Q" + str(n + 1)))),
    )
  
    taskgroup(
      title: [*Research*],
      content: text(10pt, white)[*John + Julia*],
      style: (stroke: 14pt + black),
      {
        task(
          "Research the market",
          (from: 0, to: 2, content: text(9pt)[John (70% done)]),
          style: (stroke: 13pt + gray),
        )
        task(
          "Conduct user surveys",
          (from: 1, to: 3, content: text(9pt)[Julia (50% done)]),
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
]

#pagebreak()

#outline()

#pagebreak()

= Riferimenti

#list(
  [#link("https://www.gantt.com")],
)

= Creare un diagramma di Gantt
Di seguito vengono riferite le linee guida date da #link("https://www.gantt.com")


== Review Scope Baseline
Gather the team and review the approved scope baseline, which consists of three components: 1) the Scope Statement, 2) the Work Breakdown Structure (WBS) and 3) the WBS Dictionary. The project team member should confirm that the scope baseline addresses 100% of the project scope.

#figure(caption:"review-scope-baseline")[
#image("./immagini/scope_baseline.png")
]

== Create Activities
Using a technique called Decomposition, the project team breaks down each WBS work package into activities. Just like when creating the WBS work packages, the team needs to set rules for creating schedule activities. The final schedule needs to be the one that is effective and efficient. Too many activities can be as bad as too few. It is also important to identify deadlines and milestones while decomposing the project.

#figure(caption:"create-activities")[
#image("./immagini/create-activities.png")
]

== Sequence Activities
Every activity is related to one or more other activities. Every activity, except the first and last, has a relationship with a predecessor and a successor. Sequencing activities means placing the activities in the right order using the right relationships. There are four types of relationships:
#enum(
  [*Finish to Start* \
Cannot start the successor activity until its predecessor is finished.],
  [*Start to Start* \
Cannot start the successor activity until its predecessor has started.],
  [*Start to Finish* \
Cannot finish the successor activity until its predecessor had started.],
  [*Finish to Finish*\
Cannot finish the successor activity until its predecessor has finished.],
)

Relationships 1 and 2 are the most commonly used. Finish to Start is a sequential relationship and Start to Start is typically a parallel or over-lapping relationship.


#figure(caption:"sequence-activities")[
#image("./immagini/sequence-activities.png")
]

== Estimate Resources
Before the durations can be estimated, resources must be identified and estimated. Resources include labor, material and equipment. There are several estimating techniques used including Analogous, Parametric, Three-Point and Bottom Up. Skills, competencies and technology are key factors to consider in the basis of the estimate. After estimating the resources, they are loaded in the schedule against the respective activities. A resource calendar is also created to show when resources are needed and available.

#figure(caption:"estimate-resources")[
#image("./immagini/estimate-resources.png")
]

== Estimate Durations
Duration is the time between the start and end of an activity. Review the resources, relationships and sequencing, then estimate the duration for each activity. The same estimating techniques used for estimating resources can be used to estimate durations, but make sure you identify constraints. Which are limitations or restrictions on an activity.
#figure(caption:"estimate-durations")[
#image("./immagini/estimate-durations.png")
]

== Develop Schedule
Create the Gantt chart by loading all information into a project management software tool. Review the schedule and ensure that all schedule risks have been addressed. Check that response plans and schedule contingencies have been included. A typical way to address schedule contingencies is to add Buffers at the activity level, the project level or both. A Buffer is an activity with no resources or scope to provide additional time and reduce schedule risks. Resource optimization techniques, such as resource smoothing or leveling are used to create realistic schedules. Review and approve the schedule. The approved Gantt chart schedule becomes the schedule baseline.

#figure(caption:"develop-schedules")[
#image("./immagini/develop-schedules.png")
]


#figure(caption:"project_planning")[
#image("./immagini/project_planning.png")
]

== Esempio Gantt

#let coloreDurataEffettiva=color.blue
#let coloreDuratapianificata=color.red

#let strokeEffettivo=stroke(paint: red, thickness: 4pt)
#let strokePianificato=stroke(paint: blue, thickness: 10pt)


#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group(([*Novembre*], 4)), group(([*Dicembre*], 4)), group(([*Gennaio*], 4)))
    headerline(
      group(..range(4).map(n => strong("S" + str(n + 1)))),
      group(..range(4).map(n => strong("S" + str(n + 1)))),
      group(..range(4).map(n => strong("S" + str(n + 1)))),
    )
  
    taskgroup(
      title: [*Studio di fattibilità*],
      content: text(10pt, white)[],
      style: (stroke: 14pt + black),
      {
          task("Attività 1", (from: 0, to: 1, style: (stroke: strokePianificato)), (from :0,to: 1.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 2", (from: 1, to: 2.25, style: (stroke: strokePianificato)), (from :1.2,to: 2.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 3", (from: 3, to: 4.5, style: (stroke: strokePianificato)), (from :3,to: 4.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 4", (from: 2.5, to: 4, style: (stroke: strokePianificato)), (from :2.75,to: 4.5,style:(stroke:strokeEffettivo)) 
          )
      },
    )

    taskgroup(title: [*Analisi dei Requisiti*],
          content: text(10pt, white)[],
      style: (stroke: 14pt + black), {
          task("Attività 1", (from: 0, to: 1, style: (stroke: strokePianificato)), (from :0,to: 1.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 2", (from: 1, to: 2.25, style: (stroke: strokePianificato)), (from :1.2,to: 2.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 3", (from: 0, to: 1, style: (stroke: strokePianificato)), (from :0,to: 1.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 4", (from: 0, to: 1, style: (stroke: strokePianificato)), (from :0,to: 1.5,style:(stroke:strokeEffettivo)),
          (from: 7, to: 8, style: (stroke: strokePianificato)), (from :7,to: 9,style:(stroke:strokeEffettivo)),
          )
    })

    taskgroup(title: [*Piano di Progetto*],          content: text(10pt, white)[],
      style: (stroke: 14pt + black), {

          task("Attività 1", (from: 0, to: 1, style: (stroke: strokePianificato,)), (from :0,to: 1.5,style:(stroke:strokeEffettivo),content: text(10pt, purple)["Si può scrivere anche dentro le linee"]) 
          )
          task("Attività 2", (from: 1, to: 2.25, style: (stroke: strokePianificato)), (from :1.2,to: 2.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 3", (from: 3, to: 4.5, style: (stroke: strokePianificato)), (from :3,to: 4.5,style:(stroke:strokeEffettivo)) 
          )
          task("Attività 4", (from: 2.5, to: 4, style: (stroke: strokePianificato)), (from :2.75,to: 4.5,style:(stroke:strokeEffettivo)) 
          )
    })

    milestone(
      at: 11,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *RTB*\
        Gennaio 2026
      ])
    )

    milestone(
      at: 0,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *candidatura*\
        Novembre 2025
      ])
    )
  }
)