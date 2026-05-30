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
    //FIX cambiare da 6 a 7
    (persona: persone.DT, ruolo: ruoli.Responsabile, orePreviste: 6, oreEffettive: 7),
    (persona: persone.DL, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DL, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.FELIX, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 4),
    (persona: persone.FELIX, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FILIPPO, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 3),
    (persona: persone.ANA, ruolo: ruoli.Progettista, orePreviste: 3, oreEffettive: 3),
    // FIX cambiare da verificatore a progettista
    (persona: persone.ALDO, ruolo: ruoli.Progettista, orePreviste: 5, oreEffettive: 5),
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
      - Mantenere l’attuale approccio alla pianificazione, che ha garantito una buona aderenza tra stime e consuntivi, continuando a definire task chiari e ben distribuiti tra i membri del team.
      - Accompagnare il completamento della progettazione con attività di verifica sistematica, così da assicurare la coerenza e la qualità della Specifica Tecnica in vista della fase di implementazione.

  - *Lungo termine*:
    - Strutturare la transizione verso la fase di codifica in modo progressivo, assicurando che gli artefatti progettuali siano sufficientemente maturi per evitare rielaborazioni nelle fasi successive.
    - Consolidare un approccio incrementale allo sviluppo, in cui ogni sprint produca risultati completi e validati, favorendo continuità operativa ed efficienza complessiva del progetto.
  ]
)
