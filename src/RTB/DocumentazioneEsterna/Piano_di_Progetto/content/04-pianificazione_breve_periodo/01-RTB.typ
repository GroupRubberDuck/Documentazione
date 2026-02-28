//
// Piano di Progetto
// = Sezione 5 - Pianificazione di breve periodo
// == Sottosezione 1 - Requirements and Technology Baseline
//
#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": aggiornaResiduo, displayResiduo, persone, ruoli, sprint

//
// Sprint 1
//

#let date = (
  inizio: datetime(year: 2025, month: 11, day: 10),
  finePrevista: datetime(year: 2025, month: 11, day: 25),
  fineEffettiva: datetime(year: 2025, month: 11, day: 25),
)

#let sprintcounter = counter("sprint")
#sprintcounter.update(1)
#let TODO = [
  In questo primo periodo di avanzamento, le attività del gruppo si concentrano prevalentemente sullo studio, sull'analisi preliminare e sull'impostazione del lavoro.
  L’obiettivo di questa fase è la creazione di basi solide per svolgere in modo efficace ed efficiente le attività previste negli sprint successivi.

  - Studio e prima redazione dei documenti di progetto: #list(
      [Norme di Progetto],
      [Piano di Progetto],
      [Piano di Qualifica],
      [Analisi dei Requisiti],
      [Glossario],
    )
  - Revisione delle pratiche di versionamento.
  - Revisione delle modalità di tracciamento delle modifiche ai documenti.
  - Revisione del sito web del progetto.
  - Studio degli strumenti offerti da GitHub, al fine di sfruttare le funzionalità utili della piattaforma.
  - Primo incontro con la proponente, *BlueWind*, per allineamento iniziale.
  - Ricerca e analisi degli standard di riferimento.
  - Definizione e raffinamento del workflow di lavoro.
]
#let rischiAttesi = [
  Per *lo Sprint 1*, essendo focalizzato su attività di studio e impostazione organizzativa, i principali rischi sono:

  - *R.T.1 – Comprensione errata della norma EN 18031*: possibile interpretazione incompleta dello standard di riferimento.

  - *R.T.2 – Inesperienza con le tecnologie*: uso di Typst, GitHub e workflow documentali potrebbe rallentare lo studio iniziale.

  - *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*: impegni esterni potrebbero ridurre il tempo dedicato allo studio.

  - *R.O.1 – Pianificazione iniziale errata o ottimistica*: il gruppo potrebbe sottovalutare il carico di lavoro necessario per comprendere la documentazione e impostare i processi.


]
#let rischiEffettivi = [
  Durante lo *Sprint 1* sono stati riscontrati i seguenti rischi, in linea con quanto previsto:

  - *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*:
    - Descrizione: alcuni membri hanno avuto meno tempo disponibile per impegni esterni.
    - Classificazione: *Mitigated*. È stato avviato un approfondimento volto a migliorare la definizione e la gestione delle issue, al fine di ottimizzare l’organizzazione del lavoro.

  - *R.O.1 – Pianificazione iniziale errata o ottimistica*:
    - Descrizione: alcune attività di studio e revisione documentale (Norme di Progetto e Analisi dei Requisiti) hanno richiesto più tempo del previsto.
    - Classificazione: *Mitigated*. Sono state inserite maggiori ore di lavoro in questa attività per far fronte alla errata previsione precedente.
]



#let oreProduttive = (
  (persona: persone.DL, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
  (persona: persone.ALDO, ruolo: ruoli.Amministratore, orePreviste: 3, oreEffettive: 3),
  (persona: persone.ANA, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 5),
  (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 5),
  (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
  (persona: persone.FILIPPO, ruolo: ruoli.Amministratore, orePreviste: 3, oreEffettive: 3),
)

#let retrospettiva = [
  - *Avvio e Risultati Raggiunti*:

    La Retrospettiva 1 ha rappresentato una *fase di avvio* del progetto. Durante questo sprint il gruppo si è concentrato principalmente sulla *definizione della struttura* dei documenti principali, nonché sull’individuazione delle *migliori pratiche* di versionamento e tracciamento delle modifiche. Le attività di studio e di documentazione previste sono state in larga parte completate.

  - *Criticità e Gestione dei Rischi*:

    Tuttavia, il gruppo ha riscontrato alcune difficoltà, in particolare nella *stima dei tempi* e nella *definizione delle task*. Inoltre, la comunicazione interna non risultava ancora pienamente strutturata. Le attività di mitigazione dei rischi adottate sono state valutate come mediamente efficaci: trattandosi di una fase iniziale del progetto, non è stato possibile ottenere risultati pienamente consolidati, che si prevede emergeranno nei prossimi sprint.

  - *Aree di Miglioramento*:

    Alla luce di queste considerazioni, il gruppo ha deciso che nel prossimo sprint si lavorerà in modo mirato sul *miglioramento della pianificazione*, sulla *scomposizione delle attività* e sul *rafforzamento della comunicazione interna*. Questi aspetti rappresentano infatti aree di miglioramento su cui il gruppo deve migliorare.

  - *Pianificazione Operativa Futura*:

    Di conseguenza, nel prossimo sprint si prevede un maggiore impegno nelle *attività di verifica*, dato che il metodo di lavoro non è ancora completamente strutturato, e nel ruolo di amministratore. Parallelamente, continueranno le attività principali di analisi e studio.
]
#sprint(
  numeroSprint: "1",
  timeline: date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva: retrospettiva,
)

#let sprintResiduo = aggiornaResiduo(
  old: ruoli
    .keys()
    .map(
      chiave => {
        (str(chiave), ruoli.at(chiave).oreTotali)
      },
    )
    .to-dict(),
  oreProduttive: oreProduttive,
)
#displayResiduo(
  residuo: sprintResiduo.new,
  oreConsumate: sprintResiduo.oreConsumate,
  numeroSprint: "1",
)


#sprintcounter.step()

#pagebreak()


//
// Sprint 2
//
#{
  date = (
    inizio: datetime(year: 2025, month: 11, day: 26),
    finePrevista: datetime(year: 2025, month: 12, day: 08),
    fineEffettiva: datetime(year: 2025, month: 12, day: 8),
  )


  TODO = [
    Durante questo sprint il gruppo ha deciso di  concentrare la maggior parte delle proprie energie sull’*analisi dei requisiti e la definizione dei casi d’uso*.

    In particolare il gruppo si concentra su:
    - Aggiornare e completare le Norme di Progetto (processi primari/ di supporto /organizzativi/ best practices).

    - Aggiornare il Glossario con automazioni per marcatura termini.

    - Creazione di casi d’uso e requisiti.

    - Aggiornare e verificare il Piano di Progetto.

    - Aprire issue per aggiornamento sito web, gestire versionamento e file.

    - Migliorare gestione interna con template issue e automazioni.
  ]
  rischiAttesi = [
    - *R.T.1 – Comprensione errata della norma EN 18031*: possibile interpretazione incompleta dei requisiti.

    - *R.T.2 – Inesperienza con le tecnologie*: possibili ritardi nello studio dei casi d’uso e nella produzione della documentazione.

    - *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*: assenze o imprevisti potrebbero rallentare le attività.

    - *R.O.3 – Mancanza di comunicazione e collaborazione*: compiti poco chiari e ritardi nella scomposizione dei casi d’uso.
  ]
  rischiEffettivi = [
    - *R.T.1 – Comprensione errata della norma EN 18031*:
      - Descrizione: il gruppo ha avuto difficoltà a interpretare correttamente i requisiti;
      - Classificazione: *Resolved*. Durante l’incontro periodico con l’azienda sono stati quindi posti chiarimenti specifici in merito.

    - *R.O.3 – Mancanza di comunicazione e collaborazione*:
      - Descrizione: inizialmente task poco chiari.
      - Classificazione: *Resolved*. Il gruppo ha introdotto un issue template per rendere le attività più precise e brevi incontri informali interni.

    - *R.T.2 – Inesperienza con le tecnologie*:
      - Descrizione: alcuni membri poco familiari con software e gestione documentale
      - Classificazione: *Resolved*. Utilizzo di automatizzazioni, tabelle ripetibili e scomposizione dei file dai membri più esperti.

  ]
  oreProduttive = (
    (persona: persone.DL, ruolo: ruoli.Verificatore, orePreviste: 6, oreEffettive: 6),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.ANA, ruolo: ruoli.Amministratore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 8, oreEffettive: 8),
    (persona: persone.DT, ruolo: ruoli.Analista, orePreviste: 7, oreEffettive: 7),
    (persona: persone.FILIPPO, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
  )

  retrospettiva = [
    - *Avvio e strutturazione documenti*:

      Parallelamente è stato portato avanti lo studio del materiale fornito dall’azienda e si è lavorato al miglioramento della documentazione principale, in particolare il *Piano di Progetto*, le *Norme di Progetto* e l'*Analisi dei requisiti*. Tuttavia, sono emerse difficoltà nella *definizione dei casi d’uso* e nella redazione del *documento di Analisi dei requisiti*. Per questo motivo il gruppo ha deciso di adottare inizialmente una visione ad *alto livello* (a macro-blocchi), rimandando un maggiore dettaglio ai prossimi sprint.

    - *Coordinamento Organizzativo e Strategie di Mitigazione*:

      Le principali criticità organizzative hanno riguardato il *coordinamento nella stesura dei casi d’uso* e lo *studio condiviso del materiale*. In particolare, il gruppo ha riscontrato difficoltà nel conciliare lo studio con la redazione degli altri documenti. Per mitigare tali problemi sono stati proposti *brevi incontri informali*, finalizzati alla suddivisione dello studio e alla creazione di momenti strutturati di confronto interno.

    - *Mitigazione rischi*:

      Rispetto allo Sprint 1, *le attività di mitigazione dei rischi* sono risultate complessivamente più efficaci, anche se il gruppo ritiene che sia possibile un ulteriore miglioramento. Le mitigazioni adottate dovranno quindi essere testate anche negli sprint successivi per valutarne concretamente l’efficacia.

    - *Prospettive per lo Sprint Successivo*:

      Alla luce di quanto emerso, nel *prossimo sprint* le attività principali saranno incentrate su una *definizione più accurata dei casi d’uso*; di conseguenza, i ruoli maggiormente coinvolti saranno quelli di Analista e Verificatore.
  ]
}
#sprint(
  numeroSprint: "2",
  timeline: date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva: retrospettiva,
)


#let sprintResiduo = aggiornaResiduo(
  old: sprintResiduo.new,
  oreProduttive: oreProduttive,
)
#displayResiduo(
  residuo: sprintResiduo.new,
  oreConsumate: sprintResiduo.oreConsumate,
  numeroSprint: "2",
)


#pagebreak()


//
// Sprint 3
//
//
#{
  date = (
    inizio: datetime(year: 2025, month: 12, day: 09),
    finePrevista: datetime(year: 2025, month: 12, day: 23),
    fineEffettiva: datetime(year: 2025, month: 12, day: 23),
  )


  TODO = [
  ]
  rischiAttesi = [
    - *R.P.1 – Disponibilità variabile dei membri*: La coincidenza con le festività natalizie e l'imminente sessione d'esami rendono instabile la disponibilità oraria effettiva dei membri rispetto a quella pianificata.

    - *R.T.1 – Comprensione errata della norma EN 18031*: La complessità tecnica e la lingua inglese dei documenti normativi (ACM e AUM) elevano il rischio di errate interpretazioni dei requisiti durante la fase di studio

    - *R.O.1 – Pianificazione iniziale errata*: L'assenza di dati storici pregressi e l'inesperienza del team nella stesura dei preventivi minacciano l'accuratezza delle stime temporali ed economiche.

  ]
  rischiEffettivi = [
    - *R.P.1 – Disponibilità variabile dei membri*:
      - *Classificazione*: *Mitigated*.
      - *Azione*: Adozione di gestione flessibile delle issue e formalizzazione della pausa natalizia.

    - *R.T.1 – Comprensione errata della norma EN 18031*:
      - *Classificazione*: *Resolved*.
      - *Azione*: risoluzione ottenuta tramite suddivisione delle attività tra i membri del gruppo. L'approccio ha favorito la focalizzazione individuale su singoli task e il successivo allineamento del team mediante la produzione di resoconti scritti riassuntivi.

    - *R.O.1 – Pianificazione iniziale errata*:
      - *Classificazione*: *Owned*.
      - *Azione*: assegnazione di task specifici di ricerca a singoli membri (ricerca metriche, ricerca tecnologie) per colmare le lacune.
  ]

  oreProduttive = (
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 7, oreEffettive: 7),
    (persona: persone.ANA, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FELIX, ruolo: ruoli.Responsabile, orePreviste: 5, oreEffettive: 5),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 6, oreEffettive: 6),
  )

  retrospettiva = [
    - *Avanzamento Analisi dei Requisiti (AdR)*:

      Sebbene la struttura generale dei requisiti risulti definita e l'analisi sia in fase terminale, l'attività non è ancora conclusa. I Casi d'Uso hanno raggiunto un livello di maturità stimato al 90% per struttura e contenuti.

    - *Stesura del Piano di Qualifica (PdQ)*:

      È stata prodotta la prima stesura del documento. Un punto rilevante è l'inserimento di una sezione specifica sull'indice di Gulpease, corredata da un'appendice applicativa per renderne verificabile l'utilizzo

    - * Gestione del Preventivo e Inesperienza*:

      Il gruppo ha riscontrato notevoli difficoltà nella stesura del preventivo a causa della mancanza di dati storici e dell'inesperienza dei membri.
      Per risolvere questa difficoltà il gruppo ha deciso di indicare una stima indicativa, specificando la probabilità della sua inaccuratezza, dando come motivazione l'inesperienza del gruppo.

    - *Efficacia del Metodo di Studio (Normative)*:

      Nella valutazione di "cosa ha funzionato", il gruppo ha identificato come punto di forza la suddivisione e lo studio dei documenti forniti dall'azienda (ACM e AUM) tramite la produzione di riassunti condivisi. Questo approccio ha permesso di allineare le conoscenze del team in modo efficiente. In questo modo è stato possibile scrivere use case più precisi e completi.

    - *Automazione e Strumenti (Glossario)*:

      È stato aggiornato lo script Python per la generazione del glossario web.

    - *Scelte Tecnologiche Preliminari (PoC)*:

      È stato avviato un brainstorming sulle tecnologie per il Proof of Concept (PoC). Sebbene non siano state prese decisioni definitive, il gruppo si è orientato preliminarmente verso un approccio Web-based e l'utilizzo del pattern architetturale MVC (Model-View-Controller), riconoscendo però la necessità di approfondire lo studio nel prossimo sprint.

    - *Prospettive future*:

      Si è deciso formalmente di considerare il periodo delle vacanze natalizie come una pausa operativa. Di conseguenza, non è stata effettuata la rotazione dei ruoli al termine di questo sprint e il lavoro non completato è slittato allo sprint successivo.
  ]
}
#sprint(
  numeroSprint: "3",
  timeline: date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva: retrospettiva,
)


#let sprintResiduo = aggiornaResiduo(
  old: sprintResiduo.new,
  oreProduttive: oreProduttive,
)
#displayResiduo(
  residuo: sprintResiduo.new,
  oreConsumate: sprintResiduo.oreConsumate,
  numeroSprint: "3",
)





//
// Sprint 4
//
//
#{
  date = (
    inizio: datetime(year: 2026, month: 01, day: 05),
    finePrevista: datetime(year: 2026, month: 02, day: 04),
    fineEffettiva: datetime(year: 2026, month: 02, day: 04),
  )


  TODO = [
    Questo sprint, della durata eccezionale di quattro settimane, è stato pianificato per gestire la sessione d'esami invernale. L'obiettivo principale è stato il consolidamento della Requirement Baseline (RB) e l'avvio della Technology Baseline (TB) tramite la realizzazione di un Proof of Concept (PoC).
    Le attività principali pianificate sono state:
    - *Analisi dei requisiti (AdR)*: Raffinamento dei casi d'uso e dei diagrammi UML per portare il documento a uno stato presentabile per la revisione RTB
    - *Proof of Concept (PoC)*: Creazione di un "esempio giocattolo" per testare l'integrazione tra frontend e backend e la gestione del caricamento degli alberi decisionali
    - *Piano di Qualifica (PdQ)*: Aggiornamento del documento con l'inserimento dei cruscotti di valutazione e delle metriche di qualità
    - *Norme di Progetto*: Completamento della sezione relativa ai processi.
  ]
  rischiAttesi = [
    - R.P.1 – Disponibilità variabile dei membri (Alta probabilità): La sovrapposizione con la sessione d'esami universitaria rappresentava la minaccia principale al completamento dei task, con una prevista riduzione drastica delle ore lavorabili.
    - R.T.2 – Inesperienza con le tecnologie (Media probabilità): L'adozione di nuove tecnologie per il PoC comporta il rischio di rallentamenti dovuti alla curva di apprendimento.
    - R.O.1 – Pianificazione ottimistica: Rischio di sovrastimare la capacità produttiva del gruppo nel periodo della sessione esami.
  ]
  rischiEffettivi = [
    Durante lo Sprint 4 si sono concretizzati i seguenti rischi:
    - R.P.1 – Disponibilità variabile dei membri:
      - *Classificazione*: *Accettata*. 
      - *Azione*: La sessione esami ha impedito quasi la totale operatività dei membri del gruppo, il lavoro mancante slitta al prossimo sprint.
    - R.T.2 – Inesperienza con le tecnologie:
      - *Classificazione*: *Mitigated*. 
      - *Azione*: si è deciso di procedere per gradi creando prima un "esempio giocattolo" per validare le scelte tecniche senza bloccare l'intero sviluppo
  ]
  oreProduttive = (
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 5),
    (persona: persone.ANA, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FELIX, ruolo: ruoli.Responsabile, orePreviste: 3, oreEffettive: 3),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 4),
  )

  retrospettiva = [
    La retrospettiva dello Sprint 4 ha evidenziato il forte impatto degli impegni accademici sull'avanzamento del progetto.
    
    Il workflow di approvazione dei documenti si è rivelato troppo rigido per un periodo con scarsa disponibilità sincrona, creando colli di bottiglia. Inoltre, la pianificazione si è rivelata ancora ottimistica rispetto al carico di studio individuale.
  ]
}
#sprint(
  numeroSprint: "4",
  timeline: date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva: retrospettiva,
)


#let sprintResiduo = aggiornaResiduo(
  old: sprintResiduo.new,
  oreProduttive: oreProduttive,
)
#displayResiduo(
  residuo: sprintResiduo.new,
  oreConsumate: sprintResiduo.oreConsumate,
  numeroSprint: "4",
)


//
// Sprint 5
// 
#{
  date = (
    inizio: datetime(year: 2026, month: 02, day: 05),
    finePrevista: datetime(year: 2026, month: 02, day: 18),
    fineEffettiva: datetime(year: 2026, month: 02, day: 18),
  )


  TODO = [

  ]
  rischiAttesi = [

  ]
  rischiEffettivi = [
  ]

  retrospettiva = [

  ]
}
#sprint(
  numeroSprint: "5",
  timeline: date,
  TODO: TODO,
  rischiAttesi: rischiAttesi,
  rischiEffettivi: rischiEffettivi,
  oreProduttive: oreProduttive,
  retrospettiva: retrospettiva,
  usaMatrice: true,
)


#let sprintResiduo = aggiornaResiduo(
  old: sprintResiduo.new,
  oreProduttive: oreProduttive,
)
#displayResiduo(
  residuo: sprintResiduo.new,
  oreConsumate: sprintResiduo.oreConsumate,
  numeroSprint: "5",
)


