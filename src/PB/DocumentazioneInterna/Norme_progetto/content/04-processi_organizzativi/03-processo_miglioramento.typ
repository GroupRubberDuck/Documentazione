#import "/src/config.typ": he
#import "../../../../../TypstTemplate/utilityTable.typ": utilityTable
=== Introduzione
Il *processo di miglioramento* ha lo scopo di stabilire, valutare, misurare, controllare e migliorare in modo continuo i processi del ciclo di vita del software adottati dal progetto.

Attraverso un approccio sistematico e iterativo, il processo consente di incrementare l'efficacia e l'efficienza delle attività svolte, garantendo l'allineamento agli standard di qualità e alle esigenze del progetto.

=== Attività del processo
Il processo di miglioramento è articolato nelle seguenti attività principali:

+ *Inizializzazione del processo* - Questa attività si occupa di definire e documentare i processi organizzativi adottati dal gruppo. Il presente documento assolve a questo compito, fungendo da riferimento ufficiale per la definizione dei processi.
+ *Valutazione del processo* - Questa attività consiste nello sviluppo, nella documentazione, nell'utilizzo e nella storicizzazione #footnote()[Tramite registrazione.] delle procedure di valutazione dei processi. Al fine di garantirne efficacia ed efficienza, tali procedure sono sottoposte a revisioni periodiche basate sui dati raccolti durante l'esecuzione del progetto.
+ *Miglioramento del processo* - In seguito alle attività di valutazione, vengono pianificate, attuate e documentate le azioni di miglioramento dei processi. A tal fine vengono raccolti e analizzati i seguenti dati: 1. Storico del processo; 2. Dati tecnici; 3. Risultati delle valutazioni; 4. Performance del processo.

Tali attività sono eseguite ciclicamente durante l'intero svolgimento del progetto e costituiscono la base del miglioramento continuo dei processi organizzativi.

=== Procedure operative

==== Ciclo PDCA
Le attività del processo di miglioramento si inseriscono all'interno del ciclo di miglioramento continuo *PDCA (Plan–Do–Check–Act)*:

- *Plan*: individuazione delle criticità nei processi attuali tramite retrospettive e definizione di nuovi standard o modifiche alle norme per risolverle;
- *Do*: applicazione sperimentale delle nuove procedure definite durante il normale svolgimento delle attività operative;
- *Check*: misurazione delle prestazioni tramite le metriche e confronto dei dati raccolti con lo storico precedente per valutare se il cambiamento ha portato benefici;
- *Act*: aggiornamento formale delle *Norme di Progetto* e consolidamento delle procedure che si sono rivelate efficaci, scartando quelle inefficienti.

#figure(
  caption: [Rappresentazione del ciclo PDCA applicato ai processi organizzativi],
  kind: image,
  supplement: "Figura",
  image("../images/PDCA.jpg", width: 30%),
)

===== Guida alla Retrospettiva
Il nostro gruppo ha ritenuto fondamentale l'uso della *retrospettiva*, soprattutto nell'ambito della pianificazione e del monitoraggio delle attività descritte nel #link("https://grouprubberduck.github.io/Documentazione/")[Piano di Progetto].

+ A turno, ogni membro del gruppo condivide le attività svolte e segnala eventuali problemi riscontrati.
+ Si discutono le criticità o i dubbi emersi durante le attività.
+ Alla fine della riunione, con l'assegnazione dei ruoli, le task vengono ridistribuite considerando eventuali difficoltà o problematiche segnalate.

Tutti i membri partecipano attivamente alla definizione delle azioni di miglioramento, sia sulle attività di documentazione sia sulla gestione delle issue e delle infrastrutture. #footnote[Il gruppo adotta una filosofia di miglioramento continuo, accettando che all'inizio alcune procedure possano non essere perfette o contenere errori, ma mantenendo la massima trasparenza per favorire l'apprendimento e l'ottimizzazione dei processi.]

===== Automiglioramento sulla Requirements and Technology Baseline

#block(breakable: true)[
  #utilityTable(
    caption: [Automiglioramento: Requirements and Technology Baseline],
    header: ([*Problema Generale*], [*Soluzione Generale*]),
    columns: (1fr, 1fr),
    (
      (
        [La mancanza di processi strutturati per la gestione delle attività, la rendicontazione e la nomenclatura degli artefatti genera inconsistenze, stime poco affidabili e un elevato rischio di errori manuali],
        [Adozione di strumenti e convenzioni condivise — issue tracking su GitHub, template standardizzati e fogli di rendicontazione asincrona — per centralizzare il controllo, uniformare il lavoro e ridurre il carico operativo nelle sessioni di retrospettiva],
      ),
      (
        [L'aggiornamento manuale di metriche, grafici e codici identificativi introduce inefficienze ricorrenti e aumenta la probabilità di dati non allineati o numerazioni inconsistenti],
        [Sviluppo di script di automazione che rielaborano e aggiornano metriche, grafici e mappature dei codici in modo sistematico, riducendo l'effort manuale e garantendo la coerenza dei dati nel tempo],
      ),
      (
        [La granularità insufficiente nella pianificazione e l'integrazione tardiva sul branch principale rallentano l'avanzamento e rendono difficile valutare lo stato reale del progetto],
        [Introduzione di branch feature con integrazione controllata e revisione continua del backlog a ogni sprint, suddividendo le attività complesse in sotto-issue collegate per mantenere stime affidabili e una base di codice stabile],
      ),
      (
        [La rigidità nell'assegnazione dei ruoli e la gestione informale delle modifiche riducono la flessibilità operativa e aumentano il rischio di inconsistenze nella documentazione e nel versionamento],
        [Ogni membro può svolgere attività su un secondo ruolo dichiarato esplicitamente, mentre tutti sono tenuti a rispettare le Norme di Progetto per modifiche, tracciamento e versionamento, garantendo qualità e coerenza nel tempo],
      ),
      (
        [La scarsa familiarità con le tecnologie proposte e la gestione manuale di documentazione e navigazione rallentano il lavoro e aumentano il rischio di errori e inefficienze ricorrenti],
        [Combinazione di apprendimento collaborativo per le tecnologie nuove e sviluppo di script di automazione, affiancati da un miglioramento strutturale del sito per rendere i documenti più facilmente reperibili],
      ),
    )
  )
]

===== Automiglioramento sulla Technology Baseline

#block(breakable: true)[
  #utilityTable(
    caption: [Automiglioramento: Technology Baseline],
    header: ([*Problema Generale*], [*Soluzione Generale*]),
    columns: (1fr, 1fr),
    (
      (
        [L'assenza di una strategia strutturata per la gestione del codice sorgente aumenta il rischio di conflitti, regressioni e integrazioni problematiche sul branch principale, rendendo difficile tracciare l'avanzamento delle singole funzionalità],
        [Adozione di un flusso di lavoro basato su branch dedicati per ogni feature, con integrazione sul branch principale esclusivamente tramite pull request soggette a revisione da parte di almeno un altro membro del team],
      ),
      (
        [La scrittura dei test posticipata a fasi avanzate dello sviluppo genera accumulo di debito tecnico e riduce la capacità di individuare tempestivamente regressioni o comportamenti inattesi nel codice],
        [Introduzione della pratica di scrittura dei test fin dalle prime fasi di sviluppo, garantendo la verificabilità continua del codice prodotto e riducendo il costo della correzione degli errori nel tempo],
      ),
      (
        [La mancanza di riferimenti architetturali condivisi porta a scelte implementative eterogenee tra i membri del team, compromettendo la coerenza strutturale e la manutenibilità del prodotto nel lungo periodo],
        [Adozione della Specifica Tecnica come riferimento vincolante per la scrittura del codice, assicurando che le scelte implementative siano allineate alle linee guida architetturali e alle convenzioni definite dal gruppo],
      ),
    )
  )
]