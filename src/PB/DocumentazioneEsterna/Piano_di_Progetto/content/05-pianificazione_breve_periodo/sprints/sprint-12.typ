#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "12",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 04, day: 28),
    finePrevista: datetime(year: 2026, month: 05, day: 04),
    fineEffettiva: datetime(year: 2026, month: 05, day: 04),
  ),
  TODO: [
    Il focus dello sprint è la ristrutturazione dei diagrammi della Specifica Tecnica verso un modello granulare per casi d'uso, garantendo la coerenza con l'architettura esagonale. Parallelamente, l'attività di codifica è progredita dall'impostazione iniziale all'implementazione effettiva della persistenza dati e della logica di dominio, introducendo un processo di revisione formale tramite Pull Request.
  ],
  rischiAttesi: [
      - *R.O.1 - Pianificazione errata o ottimistica*: la scomposizione dei diagrammi in unità più granulari potrebbe rivelarsi più complessa del previsto, con rischio di sottostima del tempo necessario per garantire la coerenza e la completezza dei nuovi schemi.
      - *R.T.2 - Inesperienza con le tecnologie*: l'implementazione del database e la gestione della serializzazione dell'albero decisionale richiedono un allineamento tecnico preciso tra frontend e backend, con il rischio di errori di integrazione difficili da individuare nelle fasi iniziali.
  ],
  rischiEffettivi: [
    Nessuno in particolare.
  ],
  oreProduttive: (
    (persona: persone.FELIX, ruolo: ruoli.Responsabile, orePreviste: 6, oreEffettive: 6),
    (persona: persone.FELIX, ruolo: ruoli.Programmatore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FILIPPO, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 1),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DT, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 1),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.DT, ruolo: ruoli.Programmatore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.ALDO, ruolo: ruoli.Programmatore, orePreviste: 5, oreEffettive: 6),
    (persona: persone.ALDO, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Programmatore, orePreviste: 8, oreEffettive: 8),
    (persona: persone.ANA, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 6),
    (persona: persone.ANA, ruolo: ruoli.Verificatore, orePreviste: 3, oreEffettive: 3),
  ),
  retrospettiva: [
    *Consuntivo di periodo*:
    Nel corso dello sprint 12 sono state svolte le seguenti attività:
    - *Progettazione*:
      - Scomposizione dei diagrammi delle classi in diagrammi atomici per use case (porte e service).
      - Revisione dei diagrammi secondo i feedback ricevuti (Prof. Cardin).
    - *Codifica*:
      - Avanzamento implementazione del dominio dell'MVP.
      - Implementazione del database rispettando le naming convention.
      - Definizione della struttura per la serializzazione in formato lineare dell'albero decisionale.
      - Introduzione delle Pull Request per la revisione del codice.
    - *Documentazione*:
      - Redazione del verbale interno.
      - Inizio allineamento sezione testuale della ST con i nuovi diagrammi.

    *Miglioramento della pianificazione futura*
    - *Breve termine*:
      - Pianificare in modo esplicito le attività di revisione tramite Pull Request e testing, integrandole stabilmente nel flusso di sviluppo per garantire maggiore controllo sulla qualità del codice.
    - *Lungo termine*:
      - Migliorare la capacità di pianificare sprint in contesti di forte interdipendenza tra attività, riducendo il rischio di sottostima dovuto a propagazione di modifiche tra progettazione, codifica e validazione.
  ],
)