#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "4",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 01, day: 05),
    finePrevista: datetime(year: 2026, month: 02, day: 04),
    fineEffettiva: datetime(year: 2026, month: 02, day: 04),
  ),
  TODO: [
    Questo sprint, della durata eccezionale di quattro settimane, è stato pianificato per gestire la sessione d'esami invernale. L'obiettivo principale è stato il consolidamento della Requirement Baseline (RB) e l'avvio della Technology Baseline (TB) tramite la realizzazione di un Proof of Concept (PoC).

    Le attività principali pianificate sono state:
    - *Analisi dei requisiti (AdR)*: Raffinamento dei casi d'uso e dei diagrammi UML per portare il documento a uno stato presentabile per la revisione RTB
    - *Proof of Concept (PoC)*: Creazione di un "esempio giocattolo" per testare l'integrazione tra frontend e backend e la gestione del caricamento degli alberi decisionali
    - *Piano di Qualifica (PdQ)*: Aggiornamento del documento con l'inserimento dei cruscotti di valutazione e delle metriche di qualità
    - *Norme di Progetto*: Completamento della sezione relativa ai processi.
  ],
  rischiAttesi: [
    - *R.P.1 – Disponibilità variabile dei membri (Alta probabilità)*: La sovrapposizione con la sessione d'esami universitaria rappresentava la minaccia principale al completamento dei task, con una prevista riduzione drastica delle ore lavorabili.
    - *R.T.2 – Inesperienza con le tecnologie (Media probabilità)*: L'adozione di nuove tecnologie per il PoC comporta il rischio di rallentamenti dovuti alla curva di apprendimento.
    - *R.O.1 – Pianificazione ottimistica*: Rischio di sovrastimare la capacità produttiva del gruppo nel periodo della sessione esami.
  ],
  rischiEffettivi: [
    Durante lo Sprint 4 si sono concretizzati i seguenti rischi:

    - *R.P.1 – Disponibilità variabile dei membri*:
      - *Classificazione*: *Accepted*.
      - *Azione*: La sessione esami ha impedito quasi la totale operatività dei membri del gruppo, il lavoro mancante slitta al prossimo sprint.
  ],
  oreProduttive: (
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Responsabile, orePreviste: 2, oreEffettive: 2),
    (persona: persone.ANA, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 4),
  ),
  retrospettiva: [
    - *Avanzamento e Obiettivi (Baseline):*
    Il gruppo ha lavorato per portare l'Analisi dei Requisiti a uno stato presentabile per la Requirement Baseline (RTB).

    - *Rischi Concretizzati (Impatto Esami):*
      Nonostante la pianificazione di uno sprint più lungo (4 settimane), il carico della sessione d'esami ha ridotto drasticamente la disponibilità oraria dei membri. Questo ha causato il rallentamento e lo slittamento di alcune attività tecniche, come la realizzazione dell'"esempio giocattolo" per il PoC.

    - *Criticità di Processo (Workflow Rigido):*
      Si è constatato che il workflow di approvazione adottato fino a questo momento si è rivelato un collo di bottiglia. Richiedendo che tutte le attività venissero revisionate interamente prima della pubblicazione sul main, il processo non ha retto bene ai ritardi e al lavoro asincrono tipico del periodo d'esami.

    - *Azioni Correttive:*
      Per risolvere questi blocchi, il gruppo ha deciso di:
      - Progettare un nuovo workflow di approvazione con un livello di dettaglio maggiore, in modo da poter validare e pubblicare singoli incrementi indipendentemente dagli altri.
      - Concentrare immediatamente le risorse sulle attività più urgenti per la RTB: il raffinamento dei casi d'uso e l'avanzamento pratico del PoC
      - Al fine di ottimizzare la gestione delle risorse, si è deciso di adottare un modello di ruoli più flessibile. Sebbene a ogni membro venga assegnato un ruolo di cui deve garantire l'adempimento delle task principali, è consentito svolgere ore lavorative anche in ruoli differenti.
  ],
)
