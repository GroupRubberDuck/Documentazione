#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "2",
  usaMatrice: false,
  timeline: (
    inizio: datetime(year: 2025, month: 11, day: 26),
    finePrevista: datetime(year: 2025, month: 12, day: 08),
    fineEffettiva: datetime(year: 2025, month: 12, day: 08),
  ),
  TODO: [
    Durante questo sprint il gruppo ha deciso di concentrare la maggior parte delle proprie energie sull’*analisi dei requisiti e la definizione dei casi d’uso*.

    In particolare il gruppo si concentra su:
    - Aggiornare e completare le Norme di Progetto (processi primari/ di supporto /organizzativi/ best practices).
    - Aggiornare il Glossario con automazioni per marcatura termini.
    - Creazione di casi d’uso e requisiti.
    - Aggiornare e verificare il Piano di Progetto.
    - Aprire issue per aggiornamento sito web, gestire versionamento e file.
    - Migliorare gestione interna con template issue e automazioni.
  ],
  rischiAttesi: [
    - *R.T.1 – Comprensione errata della norma EN 18031*: possibile interpretazione incompleta dei requisiti.
    - *R.T.2 – Inesperienza con le tecnologie*: possibili ritardi nello studio dei casi d’uso e nella produzione della documentazione.
    - *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*: assenze o imprevisti potrebbero rallentare le attività.
    - *R.O.3 – Mancanza di comunicazione e collaborazione*: compiti poco chiari e ritardi nella scomposizione dei casi d’uso.
  ],
  rischiEffettivi: [
    - *R.T.1 – Comprensione errata della norma EN 18031*:
      - *Classificazione*: *Resolved*.
      - *Azione*: Durante l’incontro periodico con l’azienda sono stati quindi posti chiarimenti specifici in merito.

    - *R.O.3 – Mancanza di comunicazione e collaborazione*:
      - *Classificazione*: *Resolved*.
      - *Azione*: Il gruppo ha introdotto un issue template per rendere le attività più precise e brevi incontri informali interni.

    - *R.T.2 – Inesperienza con le tecnologie*:
      - *Classificazione*: *Resolved*.
      - *Azione*: Utilizzo di automatizzazioni, tabelle ripetibili e scomposizione dei file dai membri più esperti.
  ],
  oreProduttive: (
    (persona: persone.DL, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 6),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.ANA, ruolo: ruoli.Amministratore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 8),
    (persona: persone.DT, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 7),
    (persona: persone.FILIPPO, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
  ),
  retrospettiva: [
    - *Avvio e strutturazione documenti*:
      Parallelamente è stato portato avanti lo studio del materiale fornito dall’azienda e si è lavorato al miglioramento della documentazione principale, in particolare il *Piano di Progetto*, le *Norme di Progetto* e l'*Analisi dei Requisiti*. Tuttavia, sono emerse difficoltà nella *definizione dei casi d’uso* e nella redazione del *documento di Analisi dei requisiti*. Per questo motivo il gruppo ha deciso di adottare inizialmente una visione ad *alto livello* (a macro-blocchi), rimandando un maggiore dettaglio ai prossimi sprint.

    - *Coordinamento organizzativo e strategie di mitigazione*:
      Le principali criticità organizzative hanno riguardato il *coordinamento nella stesura dei casi d’uso* e lo *studio condiviso del materiale*. In particolare, il gruppo ha riscontrato difficoltà nel conciliare lo studio con la redazione degli altri documenti. Per mitigare tali problemi sono stati proposti *brevi incontri informali*, finalizzati alla suddivisione dello studio e alla creazione di momenti strutturati di confronto interno.

    - *Mitigazione rischi*:
      Rispetto allo Sprint 1, *le attività di mitigazione dei rischi* sono risultate complessivamente più efficaci, anche se il gruppo ritiene che sia possibile un ulteriore miglioramento. Le mitigazioni adottate dovranno quindi essere testate anche negli sprint successivi per valutarne concretamente l’efficacia.

    - *Prospettive per lo sprint successivo*:
      Alla luce di quanto emerso, nel *prossimo sprint* le attività principali saranno incentrate su una *definizione più accurata dei casi d’uso*; di conseguenza, i ruoli maggiormente coinvolti saranno quelli di Analista e Verificatore.
  ],
)