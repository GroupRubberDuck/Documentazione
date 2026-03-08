#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "5",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 02, day: 05),
    finePrevista: datetime(year: 2026, month: 02, day: 18),
    fineEffettiva: datetime(year: 2026, month: 02, day: 18),
  ),
  TODO: [
    Le attività di questo sprint si sono focalizzate prioritariamente sul consolidamento dell'Analisi dei Requisiti. Parallelamente, è stato necessario un intervento di allineamento sul Piano di Progetto per garantire la coerenza documentale con l'effettivo stato di avanzamento. Nello specifico, le operazioni hanno riguardato:

    - Analisi dei Requisiti (AdR): revisione e modellazione dei casi d'uso (Use Case), integrando direttamente i riscontri emersi dal confronto con l'azienda proponente BlueWind.

    - Piano di Progetto (PdP): aggiornamento della pianificazione di breve periodo, classificazione ROAM e rendicontazione oraria multiruolo.
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
    (persona: persone.ANA, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 5),
    (persona: persone.DL, ruolo: ruoli.Responsabile, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.DL, ruolo: ruoli.Analista, orePreviste: 10, oreEffettive: 10),
    (persona: persone.ALDO, ruolo: ruoli.Amministratore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 1, oreEffettive: 1),
  ),
  retrospettiva: [
    - *Avanzamento e Obiettivi (Baseline):*
      Il gruppo ha lavorato per portare l'Analisi dei Requisiti a uno stato presentabile per la Requirement Baseline (RTB).

    - *Rischi Concretizzati (Impatto Esami):*
      Nonostante la pianificazione di uno sprint più lungo (4 settimane), il carico della sessione d'esami ha ridotto drasticamente la disponibilità oraria dei membri. Questo ha causato il rallentamento e lo slittamento di alcune attività tecniche, come la realizzazione dell'"esempio giocattolo" per il PoC.

    - *Criticità di Processo (Workflow Rigido):*
      Si è constatato che il workflow di approvazione adottato fino a questo momento si è rivelato un collo di bottiglia. Richiedendo che tutte le attività venissero revisionate interamente prima della pubblicazione sul main, il processo non ha retto bene ai ritardi e al lavoro asincrono tipico del periodo d'esami.
      Inoltre, per una rendicontazione oraria più coerente, è stata introdotta la possibilità che un membro del gruppo svolga attività relative a ruoli differenti dal proprio. Questo consente una redistribuzione del carico di lavoro più flessibile, pur mantenendo per ciascun membro un ruolo principale a cui sono associate le attività fondamentali di sua competenza.

    - *Azioni Correttive:*
      Per risolvere questi blocchi, il gruppo ha deciso di:
      - Progettare un nuovo workflow di approvazione con un livello di dettaglio maggiore, in modo da poter validare e pubblicare singoli incrementi indipendentemente dagli altri.
      - Concentrare immediatamente le risorse sulle attività più urgenti per la RTB: il raffinamento dei casi d'uso e l'avanzamento pratico del PoC
  ],
)
