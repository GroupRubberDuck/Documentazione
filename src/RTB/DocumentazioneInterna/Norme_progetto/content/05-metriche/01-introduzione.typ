Vengono riportate solo in linea generale; per maggior approfondimento consultare il documento - #link("https://grouprubberduck.github.io/Documentazione/")[Piano di Qualifica]. \
Le metriche rappresentano strumenti fondamentali per misurare, controllare e migliorare sia il processo di sviluppo sia i prodotti realizzati. Nelle norme progetto sono considerate due principali categorie di metriche:

+ *Metriche di qualità di processo*  – Consentono di valutare l’efficacia, l’efficienza e la correttezza dei processi di sviluppo, monitorando la pianificazione, l’esecuzione e la gestione delle attività.

+ *Metriche di qualità di prodotto*  – Misurano le caratteristiche intrinseche dei deliverable. \ In particolare #terms(
  ([*Funzionalità*],[
    Valuta la capacità del software di fornire correttamente le funzionalità richieste dai requisiti, assicurando completezza e coerenza rispetto alle specifiche definite.
    In particolare sono considerate:

        - *Adeguatezza*:#[ \ Presenza di funzioni appropriate per i compiti che deve svolgere]),
        - *Accuratezza*:#[ \ Capacità di fornire risultati nel modo stabilito nei requisiti]),
        - *Interoperabilità*:#[ \ La capacità del prodotto di interagire con altri sistemi definiti]),
        - *Conformità*:#[ \ Il prodotto aderisce a determinati standard di dominio]),
        - *Sicurezza*:#[ \ Non vi sono falle di sicurezza che espongono dati sensibili degli utenti]),
      
  ]),
  ([*Affidabilità*],[
    Misura la capacità del software di operare senza guasti in condizioni previste, garantendo comportamenti consistenti e riducendo al minimo malfunzionamenti.
      - * Maturità *:\ #[Capacità di evitare blocchi della applicazione a seguito di errori nel software]),
      - *Tolleranza agli errori*: \ #[Capacità di mantenere determinati livelli di prestazione in caso di errori]),
      - *Recuperabilità*: \ #[Capacità di ripristinare livelli di prestazione predeterminati e di recuperare i dati seguito di errori]),
      - * Aderenza *: \ #[Capacità di aderire a standard di affi]),
  ]),
  ([*Efficienza*],[
    Indica l’ottimizzazione delle risorse e la rapidità di risposta del software alle richieste, valutando tempi di esecuzione, throughput e utilizzo delle risorse disponibili.

    - *Comportamento temporale*:\ #[
      Capacità di soddisfare le richieste con un tempo di risposta adeguato
    ]
    - *Utilizzo delle risorse*: \ #[
      Capacità di usare le risorse in modo proporzionale alle richieste
    ]
    -  *Conformità*: \ #[Aderenza del prodotto a standard riguardanti l'efficienza]

  ]),
  ([*Usabilità*],[
    Rileva quanto il software sia intuitivo e facile da utilizzare, considerando la semplicità delle interazioni, la facilità di apprendimento e la correttezza delle operazioni da parte degli utenti.
    - *Comprensibilità*: \ #[Facilità di comprensione del prodotto]
    - *Apprendibilità*: \ #[Facilità di apprendimento delle funzionalità]
    - *Operabilità*: \ #[Semplicità di utilizzo del prodotto]
    - *Attrattività*: \ #[Capacità di fornire un'esperienza utente gradevole]
    - *Conformità*: \ #[Aderimento a standard di usabilità]

  ]),
  ([*Manutenibilità*],[
    Misura quanto facilmente il software può essere modificato o esteso senza introdurre errori, tenendo conto della complessità del codice, della modularità e della facilità di intervento sugli artefatti.
    - *Analizzabilità*: \ #[Facilità di ispezione del codice con lo scopo di cercare errori]
- *Modificabilità*: \ #[Facilità nell'apportare modifiche]
- *Stabilità*: \ #[Capacità del prodotto di arginare effetti indesiderati derivanti da modifiche o aggiunte al prodotto]
- *Testabilità*: \ #[Semplicità di testing del prodotto]
  ]),
  ([*Portabilità*],[
    Rappresenta la facilità con cui il prodotto può essere spostato da un ambiente di lavoro ad un altro.
    - *Adattabilità*: \ #[Facilità di adattamento del prodotto ad ambienti diversi]
- *Installabilità*: \ #[Facilità di installazione del prodotto su un ambiente di sviluppo]
- *Conformità*: \ #[Aderimento alle convenzioni sulla portabilità]
  - *Sostituibilità*: \ #[Facilità di migrazione da un  prodotto vecchio al prodotto oggetto del progetto]
  ]),
)

L’adozione sistematica delle metriche permette di identificare aree di miglioramento, garantire trasparenza e mantenere elevati standard di qualità durante l’intero ciclo di vita del progetto.
 

=== Nomenclatura delle Metriche
La nomenclatura adottata è la seguente:
#align(center)[*TIPO_METRICA-\#\#*]
dove:
- TIPO_METRICA = 
  - *MPC* per le metriche di qualità del processo 
  - *MPD* per le metriche di qualità del prodotto

- #strong("##") è un contatore progressivo