#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "6",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 02, day: 25),
    finePrevista: datetime(year: 2026, month: 03, day: 09),
    fineEffettiva: datetime(year: 2026, month: 03, day: 09),
  ),
  TODO: [
    
  ],
  rischiAttesi: [
    
  ],
  rischiEffettivi: [
    
  ],
  oreProduttive: (
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.ANA, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ANA, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FILIPPO, ruolo: ruoli.Programmatore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Analista, orePreviste: 7, oreEffettive: 7),
    (persona: persone.DT, ruolo: ruoli.Analista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.DT, ruolo: ruoli.Programmatore, orePreviste: 2, oreEffettive: 2),
  ),
  retrospettiva: [
    
  ],
)
