#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli
#let sprint_data = (
  numero: "14",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 05, day: 12),
    finePrevista: datetime(year: 2026, month: 05, day: 18),
    fineEffettiva: datetime(year: 2026, month: 05, day: 18),
  ),
  TODO: [
    Il focus dello sprint è il completamento della documentazione in vista della consegna finale (Product Baseline) e il completamento del frontend del MVP.
  ],
  rischiAttesi: [
    - *R.T.3 - Errori nel codice*: Durante la fase di completamento del frontend è facile che vengano introdotti errori di integrazione con il backend; la pipeline di Continuous Integration su GitHub Actions rimane attiva per individuarli tempestivamente.
    - *R.O.1 - Pianificazione errata o ottimistica*: La concentrazione di attività di chiusura documentale e di codifica frontend in un unico sprint di breve durata aumenta il rischio di sottostima del carico di lavoro effettivo.
    - *R.P.2 - Disponibilità variabile per impegni pianificati*: La prossimità della scadenza finale e degli impegni accademici può ridurre la disponibilità di alcuni membri del team.
  ],
  rischiEffettivi: [
    - *R.T.3 - Errori nel codice*: Come previsto si sono verificati errori nel codice durante lo sviluppo del frontend; questi sono stati risolti in modo incrementale attraverso fix mirati e revisione tramite Pull Request.
    - *R.O.1 - Pianificazione errata o ottimistica*: A fronte di un carico di lavoro documentale superiore alle attese, in particolare per le attività di analisi e revisione della Specifica Tecnica, il gruppo ha redistribuito alcune attività tra i membri disponibili, garantendo il completamento degli obiettivi principali entro la fine dello sprint.
  ],
  oreProduttive: (
    (persona: persone.ALDO,    ruolo: ruoli.Amministratore, orePreviste: 2,  oreEffettive: 2),
    (persona: persone.ALDO,    ruolo: ruoli.Progettista,    orePreviste: 2,  oreEffettive: 2),
    (persona: persone.ANA,     ruolo: ruoli.Programmatore,  orePreviste: 12,  oreEffettive: 12),
    (persona: persone.ANA,     ruolo: ruoli.Verificatore,  orePreviste: 3,  oreEffettive: 3),
    (persona: persone.FELIX,   ruolo: ruoli.Progettista,    orePreviste: 10, oreEffettive: 10),
    (persona: persone.FELIX,   ruolo: ruoli.Programmatore,    orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Responsabile,   orePreviste: 3,  oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista,    orePreviste: 8,  oreEffettive: 8),
    (persona: persone.DT,      ruolo: ruoli.Progettista,    orePreviste: 2,  oreEffettive: 2),
    (persona: persone.DT,      ruolo: ruoli.Verificatore,   orePreviste: 5,  oreEffettive: 6),
  ),
  retrospettiva: [
    *Consuntivo di periodo*:
    Nel corso dello sprint 14 sono state svolte le seguenti attività:
    - *Progettazione (ST)*:
      - Revisione e completamento dei diagrammi delle classi (dominio, evaluation DTO, report).
      - Stesura della sezione di gestione degli errori.
      - Pulizia e aggiornamento dei diagrammi di attività e di sequenza.
      - Pulizia della sezione sui design pattern e delle tecnologie.
      - Rimozione delle sezioni non utilizzate.
      - Aggiornamento della parte relativa al frontend.
    - *Codifica*:
      - Completamento del frontend del MVP (pagine dashboard valutazione, dettaglio asset, aggiunta asset, modifica asset, dettaglio requisito, decision tree).
      - Scrittura dei test di integrazione del backend e frontend.
      - Aggiunta di test di unità per il backend e frontend.
      - Refactoring e pulizia del codice (ruff format, fix import/export, rinomina controller per coerenza).
    - *Documentazione*:
      - Aggiornamento del Manuale Utente (sezioni installazione, istruzioni d'uso, valutazione del requisito).
      - Aggiornamento del Glossario e delle Norme di Progetto (spostamento ciclo PDCA).
      - Aggiornamento del Piano di Qualifica (revisione metriche, test di frontend, aggiornamento file di test).
      - Aggiornamento dell'Analisi dei Requisiti (rimozione precondizione sessione da lista e dettaglio dispositivi).
      - Stesura del verbale interno 2026-05-11 e del verbale esterno 2026-05-12.
    - *Incontri*:
      - Svolta riunione con l'azienda, in cui è stata presentata l'MVP.

    *Miglioramento della pianificazione futura*:
    - *Breve termine*:
      - Concentrare le risorse residue sulle attività di validazione finale, testing e redazione del consuntivo di progetto.
      - Garantire la coerenza definitiva tra Analisi dei Requisiti, Specifica Tecnica e MVP prima della consegna.
    - *Lungo termine*:
      - La fase di chiusura di un progetto richiede una pianificazione più conservativa rispetto alle fasi di sviluppo, con margini espliciti dedicati alle attività di verifica, revisione e approvazione documentale.
  ],
)