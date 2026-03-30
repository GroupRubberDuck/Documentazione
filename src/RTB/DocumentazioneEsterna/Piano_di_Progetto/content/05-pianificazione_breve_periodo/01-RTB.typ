#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": aggiornaResiduo, displayResiduo, ruoli, sprint

#import "sprints/sprint-1.typ" as s1
#import "sprints/sprint-2.typ" as s2
#import "sprints/sprint-3.typ" as s3
#import "sprints/sprint-4.typ" as s4
#import "sprints/sprint-5.typ" as s5
#import "sprints/sprint-6.typ" as s6
#import "sprints/sprint-7.typ" as s7
#import "sprints/sprint-8.typ" as s8

#let tutti_gli_sprint = (s1.sprint_data, s2.sprint_data, s3.sprint_data, s4.sprint_data, s5.sprint_data, s6.sprint_data, s7.sprint_data, s8.sprint_data)

#let statoAttuale = ruoli.keys().map(chiave => (str(chiave), ruoli.at(chiave).oreTotali)).to-dict()

#for dati in tutti_gli_sprint {
  let ore_formattate = dati.oreProduttive.map(riga => (
    persona: riga.persona,
    ruolo: riga.ruolo,
    orePreviste: riga.orePreviste,
    oreEffettive: riga.oreEffettive,
  ))

  sprint(
    numeroSprint: dati.numero,
    timeline: dati.timeline,
    TODO: dati.TODO,
    rischiAttesi: dati.rischiAttesi,
    rischiEffettivi: dati.rischiEffettivi,
    oreProduttive: dati.oreProduttive,
    retrospettiva: dati.retrospettiva,
    usaMatrice: dati.usaMatrice,
  )

  let calcolo = aggiornaResiduo(old: statoAttuale, oreProduttive: dati.oreProduttive)
  displayResiduo(residuo: calcolo.new, oreConsumate: calcolo.oreConsumate, numeroSprint: dati.numero)
  statoAttuale = calcolo.new

  pagebreak()
}
