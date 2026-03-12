#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "3",
  usaMatrice: false,
  timeline: (
    inizio: datetime(year: 2025, month: 12, day: 09),
    finePrevista: datetime(year: 2025, month: 12, day: 23),
    fineEffettiva: datetime(year: 2025, month: 12, day: 23),
  ),
  TODO: [
    Durante lo Sprint 3, il gruppo ha consolidato l'impalcatura documentale e acquisito le conoscenze di dominio necessarie al progetto. Le attività si sono concentrate in cinque macro-aree:
    - Studio del Dominio: Suddivisione, traduzione e riassunto condiviso dei documenti normativi forniti dall'azienda sui sistemi di controllo (ACM) e autenticazione (AUM).
    - Requisiti e Casi d'Uso: Avanzamento nella definizione dei requisiti e aggiornamento del Glossario con la nuova terminologia e le relative abbreviazioni.
    - Norme di Progetto: Integrazione dei processi legati al Way of Working e creazione di un'automazione in Typst per tracciare le versioni dei file.
    - Pianificazione e Rischi: Aggiornamento dei rischi nel Piano di Progetto e ricerca su nuove tecniche di pianificazione e stima per far fronte all'inesperienza del team.
    - Qualità (Piano di Qualifica): Avvio della prima stesura del documento, supportata da una ricerca preventiva per individuare le metriche di qualità più adatte.
  ],
  rischiAttesi: [
    - *R.P.1 – Disponibilità variabile dei membri*: La coincidenza con le festività natalizie e l'imminente sessione d'esami rendono instabile la disponibilità oraria effettiva dei membri rispetto a quella pianificata.
    - *R.T.1 – Comprensione errata della norma EN 18031*: La complessità tecnica e la lingua inglese dei documenti normativi (ACM e AUM) elevano il rischio di errate interpretazioni dei requisiti durante la fase di studio.
    - *R.O.1 – Pianificazione iniziale errata*: L'assenza di dati storici pregressi e l'inesperienza del team nella stesura dei preventivi minacciano l'accuratezza delle stime temporali ed economiche.
  ],
  rischiEffettivi: [
    - *R.P.1 – Disponibilità variabile dei membri*:
      - *Classificazione*: *Mitigated*.
      - *Azione*: Adozione di gestione flessibile delle issue e formalizzazione della pausa natalizia.

    - *R.T.1 – Comprensione errata della norma EN 18031*:
      - *Classificazione*: *Resolved*.
      - *Azione*: risoluzione ottenuta tramite suddivisione delle attività tra i membri del gruppo. L'approccio ha favorito la focalizzazione individuale su singoli task e il successivo allineamento del team mediante la produzione di resoconti scritti riassuntivi.

    - *R.O.1 – Pianificazione iniziale errata*:
      - *Classificazione*: *Owned*.
      - *Azione*: assegnazione di task specifici di ricerca a singoli membri (ricerca metriche, ricerca tecnologie) per colmare le lacune.
  ],
  oreProduttive: (
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 3),
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 7),
    (persona: persone.ANA, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FELIX, ruolo: ruoli.Responsabile, orePreviste: 5, oreEffettive: 5),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 6),
  ),
  retrospettiva: [
    - *Avanzamento Analisi dei Requisiti (AdR)*:
      Sebbene la struttura generale dei requisiti risulti definita e l'analisi sia in fase terminale, l'attività non è ancora conclusa. I Casi d'Uso hanno raggiunto un livello di maturità stimato al 90% per struttura e contenuti.

    - *Stesura del Piano di Qualifica (PdQ)*:
      È stata prodotta la prima stesura del documento. Un punto rilevante è l'inserimento di una sezione specifica sull'indice di Gulpease, corredata da un'appendice applicativa per renderne verificabile l'utilizzo.

    - * Gestione del Preventivo e Inesperienza*:
      Il gruppo ha riscontrato notevoli difficoltà nella stesura del preventivo a causa della mancanza di dati storici e dell'inesperienza dei membri. Per risolvere questa difficoltà il gruppo ha deciso di indicare una stima indicativa, specificando la probabilità della sua inaccuratezza, dando come motivazione l'inesperienza del gruppo.

    - *Efficacia del Metodo di Studio (Normative)*:
      Nella valutazione di "cosa ha funzionato", il gruppo ha identificato come punto di forza la suddivisione e lo studio dei documenti forniti dall'azienda (ACM e AUM) tramite la produzione di riassunti condivisi. Questo approccio ha permesso di allineare le conoscenze del team in modo efficiente. In questo modo è stato possibile scrivere use case più precisi e completi.

    - *Automazione e Strumenti (Glossario)*:
      È stato aggiornato lo script Python per la generazione del glossario web.

    - *Scelte Tecnologiche Preliminari (PoC)*:
      È stato avviato un brainstorming sulle tecnologie per il Proof of Concept (PoC). Sebbene non siano state prese decisioni definitive, il gruppo si è orientato preliminarmente verso un approccio Web-based e l'utilizzo del pattern architetturale MVC (Model-View-Controller), riconoscendo però la necessità di approfondire lo studio nel prossimo sprint.

    - *Prospettive future*:
      Si è deciso formalmente di considerare il periodo delle vacanze natalizie come una pausa operativa. Di conseguenza, non è stata effettuata la rotazione dei ruoli al termine di questo sprint e il lavoro non completato è slittato allo sprint successivo.
  ],
)