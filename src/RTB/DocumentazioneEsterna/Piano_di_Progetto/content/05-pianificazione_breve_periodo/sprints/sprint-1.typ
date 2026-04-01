#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "1",
  usaMatrice: false,
  timeline: (
    inizio: datetime(year: 2025, month: 11, day: 10),
    finePrevista: datetime(year: 2025, month: 11, day: 25),
    fineEffettiva: datetime(year: 2025, month: 11, day: 25),
  ),
  TODO: [
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
  ],
  rischiAttesi: [
    Per *lo Sprint 1*, essendo focalizzato su attività di studio e impostazione organizzativa, i principali rischi sono:

    - *R.T.1 – Comprensione errata della norma EN 18031*: possibile interpretazione incompleta dello standard di riferimento.

    - *R.T.2 – Inesperienza con le tecnologie*: uso di Typst, GitHub e workflow documentali potrebbe rallentare lo studio iniziale.

    - *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*: impegni esterni potrebbero ridurre il tempo dedicato allo studio.

    - *R.O.1 – Pianificazione iniziale errata o ottimistica*: il gruppo potrebbe sottovalutare il carico di lavoro necessario per comprendere la documentazione e impostare i processi.
  ],
  rischiEffettivi: [
    Durante lo *Sprint 1* sono stati riscontrati i seguenti rischi, in linea con quanto previsto:

    - *R.P.1 – Disponibilità variabile dei membri del team o imprevisti di impegno*:
      - *Classificazione*: *Mitigated*.
      - *Azione*: È stato avviato un approfondimento volto a migliorare la definizione e la gestione delle issue, al fine di ottimizzare l’organizzazione del lavoro.

    - *R.O.1 – Pianificazione iniziale errata o ottimistica*:
      - *Classificazione*: *Mitigated*.
      - *Azione*: Sono state inserite maggiori ore di lavoro in questa attività per far fronte alla errata previsione precedente.
  ],
  oreProduttive: (
    (persona: persone.DL, ruolo: ruoli.Responsabile, orePreviste: 3, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 3),
    (persona: persone.ANA, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 5),
    (persona: persone.FELIX, ruolo: ruoli.Analista, orePreviste: 4, oreEffettive: 5),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Amministratore, orePreviste: 3, oreEffettive: 3),
  ),
  retrospettiva: [
    - *Risultati raggiunti*: Durante questo sprint il gruppo si è concentrato principalmente sulla *definizione della struttura* dei documenti principali, nonché sull’individuazione delle *migliori pratiche* di versionamento e tracciamento delle modifiche. Le attività di studio e di documentazione previste sono state in larga parte completate.

    - *Criticità e gestione dei rischi*:
      Il gruppo ha riscontrato alcune difficoltà, in particolare nella *stima dei tempi* e nella *definizione delle task*. Inoltre, la comunicazione interna non risultava ancora pienamente strutturata. Le attività di mitigazione dei rischi adottate sono state valutate come mediamente efficaci: trattandosi di una fase iniziale del progetto, non è stato possibile ottenere risultati pienamente consolidati, che si prevede emergeranno nei prossimi sprint.

    - *Aree di miglioramento*:
      Alla luce di queste considerazioni, il gruppo ha deciso che nel prossimo sprint si lavorerà in modo mirato sul *miglioramento della pianificazione*, sulla *scomposizione delle attività* e sul *rafforzamento della comunicazione interna*. Questi aspetti rappresentano infatti aree di miglioramento su cui il gruppo deve migliorare.

    - *Pianificazione operativa futura*:
      Di conseguenza, nel prossimo sprint si prevede un maggiore impegno nelle *attività di verifica*, dato che il metodo di lavoro non è ancora completamente strutturato, e nel ruolo di amministratore. Parallelamente, continueranno le attività principali di analisi e studio.
  ],
)