#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "9",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 04, day: 07),
    finePrevista: datetime(year: 2026, month: 04, day: 13),
    fineEffettiva: datetime(year: 2026, month: 04, day: 13),
  ),
  TODO: [
  Le attività del presente sprint si sono concentrate principalmente sull'avanzamento del documento
  di Specifica Tecnica (ST) e sulla prima stesura del Manuale Utente, in parallelo all'aggiornamento
  del Piano di Progetto.
  ],
  rischiAttesi: [
    - *R.O.1 - Pianificazione iniziale errata o ottimistica*: la redazione dei diagrammi di sequenza è un'attività di difficile stima, con rischio di sottovalutazione del carico di lavoro effettivo.
    - *R.P.2 - Disponibilità variabile per impegni pianificati*: a breve durata dello sprint (una settimana) riduce i margini di recupero in caso di imprevisti.
  ],
  rischiEffettivi: [
    Nessun particolare rischio si è presentato durante questo sprint.
  ],
  oreProduttive: (
    (persona: persone.ALDO, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 0, oreEffettive: 2),
    (persona: persone.ANA, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 0, oreEffettive: 1),
    (persona: persone.FILIPPO, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.DT, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 2),
  ),
  retrospettiva: [

  *Consuntivo di periodo: azioni svolte e consumi rilevati.*
  Nel corso dello sprint 9 sono state svolte le seguenti attività:
  - *Specifica Tecnica*: 
    - affinamento dell'architettura logica esagonale (pro e contro); 
    - prima stesura della sezione dei design pattern (Strategy, Observer, Command, Adapter); 
    - prima redazione dei diagrammi di sequenza.
  - *Manuale Utente*: 
    - prima stesura sezioni introduttive.
  - *Piano di Progetto*: 
    - aggiornato con nuova struttura della gestione delle attività su indicazione del professor Vardanega.
  Sul fronte dei consumi, le ore effettive (26) hanno superato quelle pianificate (23) con uno
  scostamento di +3 ore (+12%). Lo scostamento è concentrato nel ruolo di Verificatore (3 ore
  consuntivate vs 0 pianificate).
  
  *Grado di raggiungimento degli obiettivi.*
  Gli obiettivi dello sprint 9 sono stati raggiunti parzialmente:
  - *Raggiunti*: 
    - stesura architettura logica ST; 
    - redazione diagrammi di sequenza; 
    - avvio design pattern; 
    - prima stesura Manuale Utente; 
    - aggiornamento PdP.
  - *Parzialmente Raggiunti*:
    - la sezione dei design pattern è in bozza e richiederà revisione;
  - *Non Raggiunti*: 
    - l'inizio della progettazione del diagramma delle classi, pianificato come obbiettivo secondario, è slittato allo sprint 10. \ La ragione presunta dello scostamento orario è la sottostima delle attività di verifica in questo sprint.

  *Misure correttive e aggiornamento dell'analisi dei rischi.*

  A seguito della retrospettiva, il team ha adottato le seguenti misure: 
  - *R.O.1- Pianificazione Errata o Ottimistica*: le stime per le attività di progettazione di dettaglio saranno scomposte in task più granulari a inizio sprint, con revisione collettiva prima dell'avvio. 
  - *Nuova misura organizzativa*: introduzione di una mini-riunione informale di allineamento a
  metà sprint, aperta a tutti i membri disponibili, per monitorare l'avanzamento e
  redistribuire eventuali attività prima che i ritardi si accumulino.
  - *Processo di Approvazione*: tutti i task dovranno transitare per lo stato «In approvazione» prima di essere spostati in «Done», al fine di facilitare la retrospettiva.

  *Miglioramento della pianificazione futura*
  - *Breve termine*: 
    - Priorità alla progettazione del diagramma delle classi.
    - Completamento della  sezione design pattern nella Specifica Tecnica e revisione della vista dati MongoDB.
    - Ruoli assegnati:
      - Responsabile — Davide Testolin; 
      - Amministratore — Felician Mario Necsulescu;
      - Progettisti — tutto il gruppo;
      - Verificatori — Filippo Guerra, Davide Lorenzon.
  - *Lungo termine*:
    - La Product Baseline richiede il completamento della Specifica Tecnica (diagrammi delle classi e design pattern) prima di avviare la fase di codifica; il ritardo accumulato sui diagrammi delle classi impone di considerare questo task come bloccante per i prossimi sprint.
    - Il Manuale Utente potrà essere completato nelle guide operative solo a seguito della disponibilità dell'applicazione;
  ],
)
