#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "11",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 04, day: 21),
    finePrevista: datetime(year: 2026, month: 04, day: 27),
    fineEffettiva: datetime(year: 2026, month: 04, day: 27),
  ),
  TODO: [
    In questo sprint l'obiettivo principale è l'avvio della codifica del dominio (MVP) e il consolidamento della documentazione tecnica.
  ],
  rischiAttesi: [
- *R.T.2 - Inesperienza con le tecnologie*: l'inizio dell'attività di traduzione dei requisiti in codice potrebbe richiedere più tempo del previsto per l'allineamento sulle convenzioni di naming e per l'analisi della struttura dell'MVP in coerenza con la Specifica Tecnica.
  ],
  rischiEffettivi: [
    Nessuno in particolare.
  ],
  oreProduttive: (
    (persona: persone.ANA, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.ALDO, ruolo: ruoli.Progettista, orePreviste: 6, oreEffettive: 6),
    (persona: persone.DL, ruolo: ruoli.Progettista, orePreviste: 8, oreEffettive: 10),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 3),
    (persona: persone.FILIPPO, ruolo: ruoli.Programmatore, orePreviste: 3, oreEffettive: 3),
    (persona: persone.DT, ruolo: ruoli.Programmatore, orePreviste: 3, oreEffettive: 3),
  ),
  retrospettiva: [
    *Consuntivo di periodo*:
    Nel corso dello sprint 11 sono state svolte le seguenti attività:
    - *Codifica*:
      - Avvio dell'attività di codifica del dominio
      - Setup dell'ambiente MVP
      - Definizione delle Naming convention su NdP
    - *Documentazione*:
      - Redazione ST - frontend e sezione design pattern
    *Miglioramento della pianificazione futura*
    - *Breve termine*:
      - Migliorare la pianificazione della fase di codifica  garantendo una maggiore coerenza tra Specifica Tecnica e implementazione fin dalle prime attività, così da ridurre rielaborazioni successive.

    - *Lungo termine*:
        - Rafforzare la stabilità del processo di sviluppo man mano che cresce l’MVP, migliorando la pianificazione degli sprint successivi in base all’evoluzione reale del sistema e non solo alle previsioni iniziali.
  ],
)