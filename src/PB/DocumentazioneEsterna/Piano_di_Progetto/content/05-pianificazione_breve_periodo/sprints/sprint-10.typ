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
    In questo sprint il focus è stato unicamente sulla progettazione, quindi sulla stesura e miglioramento del documento Specifica Tecnica.
  ],
  rischiAttesi: [
    - *R.O.1 - Pianificazione iniziale errata o ottimistica*: la redazione dei diagrammi delle classi è un'attività di difficile stima, con rischio di sottovalutazione del carico di lavoro effettivo.
    - *R.P.2 - Disponibilità variabile per impegni pianificati*: la breve durata dello sprint (una settimana) riduce i margini di recupero in caso di imprevisti.
  ],
  rischiEffettivi: [
    Nessuno in particolare.
  ],
  oreProduttive: (
    (persona: persone.DT, ruolo: ruoli.Responsabile, orePreviste: 6, oreEffettive: 6),
    (persona: persone.DL, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DL, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.FELIX, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 4),
    (persona: persone.FELIX, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FILIPPO, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.ANA, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
  ),
  retrospettiva: [
    *Consuntivo di periodo*:
    Nel corso dello sprint 10 sono state svolte le seguenti attività:
    - *Specifica Tecnica*:
      - avanzamento nella sezione diagramma delle classi (5, 6, 7)
      - sezione schema dati
      - diagrammi di importazione, esportazione e generazione del report
      - miglioramento dell'area assets
      - stesura della sezione design pattern

    *Miglioramento della pianificazione futura*
    - *Breve termine*:
      - Continuare la fase di progettazione.
      - Iniziare la fase di codifica.
      - Ruoli assegnati:
        - Responsabile — Ana Maria Draghici;
        - Amministratore — Filippo Guerra, Davide Testolin;
        - Progettisti — tutto il gruppo.
    - *Lungo termine*:
      - Completamento della Specifica Tecnica nelle sezioni mancanti in modo da portare il documento a uno stato approvabile prima dell'avvio della fase di implementazione.
  ],
)
