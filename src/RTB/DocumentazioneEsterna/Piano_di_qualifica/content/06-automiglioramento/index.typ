#import "/src/config.typ": template_dir, inserisciLink
#import "../../../../../TypstTemplate/utilityTable.typ": utilityTable



== Automiglioramento sull'organizzazione

#utilityTable(
  caption: [Automiglioramento: Organizzazione],
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
  )
)

== Automiglioramento sulla gestione dei Ruoli

#utilityTable(
  caption: [Automiglioramento: Ruoli],
  header: ([*Problema Generale*], [*Soluzione Generale*]),
  columns: (1fr, 1fr),
  (
    (
      [La rigidità nell'assegnazione dei ruoli e la gestione informale delle modifiche riducono la flessibilità operativa e aumentano il rischio di inconsistenze nella documentazione e nel versionamento],
      [Ogni membro può svolgere attività su un secondo ruolo dichiarato esplicitamente, mentre tutti sono tenuti a rispettare le Norme di Progetto per modifiche, tracciamento e versionamento, garantendo qualità e coerenza nel tempo],
    ),
  )
)

== Automiglioramento sulla gestione degli strumenti

#utilityTable(
  caption: [Automiglioramento: Strumenti],
  header: ([*Problema Generale*], [*Soluzione Generale*]),
  columns: (1fr, 1fr),
  (
    (
      [La scarsa familiarità con le tecnologie proposte e la gestione manuale di documentazione e navigazione rallentano il lavoro e aumentano il rischio di errori e inefficienze ricorrenti],
      [Combinazione di apprendimento collaborativo per le tecnologie nuove e sviluppo di script di automazione, affiancati da un miglioramento strutturale del sito per rendere i documenti più facilmente reperibili],
    ),
  )
)



== Considerazioni Finali
Il monitoraggio continuo delle metriche di qualità e avanzamento consente al team di individuare tempestivamente scostamenti rispetto alla pianificazione, intervenendo prima che diventino problemi difficilmente recuperabili. Indicatori come CPI, SPI, EAC e TCPI non sono un'attività fine a sé stessa: alimentano decisioni concrete sulla redistribuzione del lavoro, la revisione delle stime e la ripriorizzazione del backlog.

L'automazione del calcolo e dell'aggiornamento delle metriche ha reso il processo sostenibile, mentre le pratiche di automiglioramento documentate testimoniano la volontà del team di affinare progressivamente il proprio modo di lavorare. Monitorare significa comprendere dove si è, dove si vuole arrivare e quali correzioni adottare per farlo nel modo più efficace possibile.