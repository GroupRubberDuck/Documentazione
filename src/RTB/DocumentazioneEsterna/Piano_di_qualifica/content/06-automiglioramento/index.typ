#import "/src/config.typ": template_dir, inserisciLink
#import "../../../../../TypstTemplate/utilityTable.typ": utilityTable



== Automiglioramento sull'organizzazione

#utilityTable(
  caption: [Automiglioramento: Organizzazione],
  header: ([*Problema Riscontrato*], [*Soluzione Adottata*]),
  columns: (1fr, 1fr),
  (
    (
      [L'assenza di un sistema strutturato per il monitoraggio delle attività ostacola la produttività e rende difficoltosa la pianificazione],
      [Adozione di un sistema di issue tracking su GitHub per centralizzare la gestione e il controllo dello stato di avanzamento del lavoro],
    ),
    (
      [La lentezza nell'integrazione del lavoro sul branch principale compromette la disponibilità di dati aggiornati per monitorare l'avanzamento],
      [Adozione di branch feature dedicati che vengono integrati sul main solo dopo approvazione, riducendo i conflitti e mantenendo la base di codice stabile],
    ),
    (
      [Raccogliere la rendicontazione delle ore in sede di retrospettiva appesantisce le riunioni e riduce l'efficacia del momento di confronto],
      [Adozione di un foglio condiviso su Google Drive per la registrazione asincrona delle ore per ruolo, alleggerendo il carico delle sessioni di retrospettiva],
    ),
    (
      [L'assenza di convenzioni condivise per la denominazione di risorse e artefatti genera inconsistenze e rende difficoltosa la stima e il calcolo delle ore assegnate, con impatto diretto sulla definizione del preventivo iniziale],
      [Introduzione di template per le issue con classificazione della dimensione del task (XS, S, M, L), sprint di riferimento e regole di nomenclatura uniformi per issue, branch e file],
    ),
    (
      [La granularità insufficiente nella definizione delle attività rende le stime temporali poco affidabili e il backlog difficile da gestire],
      [Il team rivaluterà ad ogni sprint il lavoro svolto e quello residuo, affinando le stime. Le issue di grandi dimensioni potranno essere suddivise in sotto-issue collegate alla issue padre, sfruttando le funzionalità native di GitHub],
    ),
    (
      [L'aggiornamento e il ricalcolo manuale delle metriche richiede un effort elevato e introduce il rischio di errori o dati non allineati],
      [Sviluppo di script di automazione che rielaborano i dati e aggiornano tutte le metriche e i relativi grafici in modo automatico a ogni esecuzione],
    ),
    (
      [L'inserimento di nuovi casi d'uso o requisiti nell'analisi dei requisiti sfaldava la numerazione dei codici esistenti; ],
      [Sviluppo di uno script che mappa automaticamente i codici e suddivide i casi d'uso in file separati, semplificando la gestione dei collegamenti e riducendo il rischio di errori],
    ),
  )
)

== Automiglioramento sulla gestione dei Ruoli
#utilityTable(
  caption: [Automiglioramento: Ruoli],
  header: ([*Problema Riscontrato*], [*Soluzione Adottata*]),
  columns: (1fr, 1fr),
  (
    (
      [Assegnare un unico ruolo fisso per l'intera durata dello sprint risulta poco flessibile e può lasciare alcuni membri, in particolare i verificatori, senza attività produttive da svolgere],
      [Ogni membro può svolgere task appartenenti a un secondo ruolo oltre al proprio, purché dichiarato esplicitamente e documentato nel Piano di Progetto, permettendo di sfruttare al meglio le ore produttive e concentrarsi sulle attività più rilevanti],
    ),
    (
      [La gestione informale delle modifiche a documentazione e versionamento può introdurre inconsistenze e abbassare la qualità complessiva del progetto],
      [Tutti i membri sono tenuti a rispettare le regole definite nelle Norme di Progetto in merito alle modifiche approvate, al tracciamento e alla gestione del versionamento],
    ),
  )
)

== Automiglioramento sulla gestione degli strumenti 

#utilityTable(
  caption: [Automiglioramento: Strumenti],
  header: ([*Problema Riscontrato*], [*Soluzione Adottata*]),
  columns: (1fr, 1fr),
  (
    (
      [Le tecnologie proposte dalla proponente sono nuove o poco familiari ai membri del gruppo, rendendo difficoltoso un utilizzo immediato ed efficace],
      [Il gruppo acquisisce le fondamenta delle tecnologie proposte, approfondendo successivamente solo il necessario. I membri in difficoltà sono incoraggiati a dialogare e richiedere supporto agli altri componenti del team],
    ),
    (
      [L'inserimento manuale delle voci nel glossario richiede di riordinare continuamente le parole in ordine alfabetico, rallentando il lavoro di documentazione],
      [Sviluppo di uno script che alloca automaticamente le nuove voci nella sezione corretta del glossario, eliminando la necessità di riordinamento manuale],
    ),
    (
      [La navigazione del sito web risulta poco intuitiva e rende difficoltoso il reperimento dei documenti da parte degli utenti],
      [Miglioramento della struttura del sito tramite divisione dei contenuti a blocchi e disposizione dei documenti in ordine temporale dal più recente, facilitando la consultazione e l'orientamento],
    ),
  )
)


== Considerazioni Finali
Il monitoraggio continuo delle metriche di qualità e avanzamento consente al team di individuare tempestivamente scostamenti rispetto alla pianificazione, intervenendo prima che diventino problemi difficilmente recuperabili. Indicatori come CPI, SPI, EAC e TCPI non sono un'attività fine a sé stessa: alimentano decisioni concrete sulla redistribuzione del lavoro, la revisione delle stime e la ripriorizzazione del backlog.

L'automazione del calcolo e dell'aggiornamento delle metriche ha reso il processo sostenibile, mentre le pratiche di automiglioramento documentate testimoniano la volontà del team di affinare progressivamente il proprio modo di lavorare. Monitorare significa comprendere dove si è, dove si vuole arrivare e quali correzioni adottare per farlo nel modo più efficace possibile.