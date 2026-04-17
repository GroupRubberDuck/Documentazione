#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "10",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 04, day: 14),
    finePrevista: datetime(year: 2026, month: 04, day: 20),
    fineEffettiva: datetime(year: 2026, month: 04, day: 20),
  ),
  TODO: [

  ],
  rischiAttesi: [
    - *R.O.1 - Pianificazione iniziale errata o ottimistica*: la redazione dei diagrammi di sequenza è un'attività di difficile stima, con rischio di sottovalutazione del carico di lavoro effettivo.
    - *R.P.2 - Disponibilità variabile per impegni pianificati*: a breve durata dello sprint (una settimana) riduce i margini di recupero in caso di imprevisti.
  ],
  rischiEffettivi: [
    // Post sprint
  ],
  oreProduttive: (
    (persona: persone.ALDO, ruolo: ruoli.Progettista, orePreviste: 0, oreEffettive: 0),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 0, oreEffettive: 0),
    (persona: persone.ANA, ruolo: ruoli.Progettista, orePreviste: 0, oreEffettive: 0),
    (persona: persone.FELIX, ruolo: ruoli.Progettista, orePreviste: 0, oreEffettive: 0),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 0, oreEffettive: 0),
    (persona: persone.FILIPPO, ruolo: ruoli.Responsabile, orePreviste: 0, oreEffettive: 0),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista, orePreviste: 0, oreEffettive: 0),
    (persona: persone.DL, ruolo: ruoli.Progettista, orePreviste: 0, oreEffettive: 0),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 0, oreEffettive: 0),
    (persona: persone.DT, ruolo: ruoli.Progettista, orePreviste: 0, oreEffettive: 0),
  ),
  retrospettiva: [
    // Post sprint
  ],
)
