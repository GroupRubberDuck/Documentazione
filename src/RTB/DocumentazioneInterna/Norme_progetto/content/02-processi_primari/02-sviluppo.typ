=== Introduzione

Il processo di sviluppo descrive l’insieme delle attività necessarie alla realizzazione del prodotto software, a partire dall’analisi dei requisiti fino alla consegna e accettazione del sistema finale.

Secondo lo standard #link("https://www.iso.org/standard/63712.html")[Standard ISO 12207:2017], il processo di sviluppo comprende tutte le attività tecniche volte a trasformare i requisiti concordati con il committente in un *prodotto software funzionante, verificato e conforme agli obiettivi di qualità stabiliti*.
Tali attività includono l’analisi dei requisiti, la progettazione dell’architettura, la codifica, l’integrazione, il testing e la validazione del sistema.

Nel contesto del progetto, il processo di sviluppo è adottato per garantire che ogni fase di realizzazione del software sia svolta in modo *sistematico, tracciabile e coerente* con le specifiche definite, assicurando la *qualità, l’affidabilità e la manutenibilità* del prodotto nel tempo.

=== Scopo del processo
Lo scopo del processo di sviluppo è garantire la corretta realizzazione del prodotto software in conformità ai requisiti funzionali, di qualità e di vincolo definiti nel capitolato e nell’Analisi dei Requisiti.

In particolare, il processo di sviluppo ha l’obiettivo di:

- *Trasformare i requisiti approvati in una soluzione software* progettata e implementata correttamente;

- *Assicurare la tracciabilità* tra requisiti, componenti progettuali, codice e test;

- Garantire che il software *soddisfi gli standard di qualità* stabiliti;

- Individuare e correggere tempestivamente eventuali difetti attraverso *attività di verifica e validazione*;

- Produrre un sistema software *affidabile, manutenibile e conforme alle aspettative* della proponente.

Il processo di sviluppo costituisce quindi il fulcro tecnico del progetto e guida in modo strutturato tutte le attività necessarie alla costruzione del prodotto finale.

=== Attività del processo 
Il processo di sviluppo è articolato in un insieme di attività tra loro correlate, definite in conformità allo *standard ISO/IEC 12207*, che guidano la realizzazione del prodotto software lungo l’intero ciclo di vita.

Le principali attività previste sono le seguenti:
#pad(left: 1em)[ 
+ *Analisi dei requisiti* \ Attività volta all’identificazione, analisi e formalizzazione dei requisiti funzionali, di qualità e di vincolo del sistema. I requisiti vengono raccolti a partire dal capitolato e dal confronto con la proponente, documentati nell’Analisi dei Requisiti e resi tracciabili per le successive fasi di progettazione, implementazione e verifica.
+ *Progettazione dell’architettura del sistema* \ Definizione della struttura generale del sistema, individuando le componenti principali, le loro responsabilità e le interazioni tra di esse, al fine di soddisfare i requisiti individuati.
+ *Progettazione dell’architettura software* \ Scomposizione del sistema in componenti software e moduli, con definizione delle interfacce e delle dipendenze, mantenendo la coerenza con l’architettura di sistema e garantendo la tracciabilità dei requisiti.
+ *Progettazione di dettaglio* \ Definizione dettagliata delle singole componenti software e delle unità che le compongono, fornendo le informazioni necessarie alla fase di codifica.
+ *Codifica* \ Implementazione del software secondo quanto definito in fase di progettazione, adottando convenzioni di stile e buone pratiche di programmazione per garantire leggibilità, manutenibilità e qualità del codice.
+ *Testing delle unità e integrazione del software* \ Verifica del corretto funzionamento delle singole unità software e successiva integrazione delle componenti, accompagnata da test di integrazione per individuare eventuali difetti.
+ *Verifica e validazione del sistema* \ Esecuzione dei test di qualifica del software e del sistema per verificare la conformità ai requisiti e agli obiettivi di qualità definiti nel Piano di Qualifica.
+ *Installazione e supporto all’accettazione* \ Consegna del prodotto software nell’ambiente concordato e supporto alla proponente nelle attività di accettazione, al fine di verificare il soddisfacimento dei requisiti contrattuali.
]

=== Inquadramento del processo nelle Baseline di progetto

Il processo di sviluppo è strettamente collegato alle baseline previste dal progetto:

*Requirements and Technology Baseline (RTB)* \ Comprende principalmente le attività di:

- Analisi dei Requisiti;

- Prime attività di codifica e prototipazione, ove previste.

*Product Baseline (PB)*
\ Comprende principalmente le attività di:

- Progettazione dell’architettura di sistema;

- Progettazione dell’architettura software;

- Codifica completa del prodotto.

=== Procedure operative 
Le attività del processo di sviluppo vengono svolte seguendo procedure operative standardizzate, al fine di garantire coerenza, tracciabilità e qualità del prodotto software. \ Ogni procedura è supportata e documentata tramite i principali artefatti di progetto: Analisi dei Requisiti (AdR), Piano di Progetto (PdP), Piano di Qualifica (PdQ) e Norme di Progetto (NdP). 

*Analisi dei requisiti* 
- Analizzare il capitolato e la documentazione fornita dalla proponente;
- Raccogliere eventuali chiarimenti tramite comunicazioni ufficiali;
- Identificare gli attori del sistema e le principali interazioni con il software;
- Individuare e descrivere i casi d’uso, specificando per ciascuno
#pad(left: 1em)[ 
+ attori coinvolti;
+ scenario principale;
+ scenari alternativi ed eccezioni;
]
- Assegnare a ogni caso d’uso un identificativo univoco secondo una nomenclatura coerente;
- Derivare dai casi d’uso e dal capitolato i requisiti del sistema;
- Classificare i requisiti in:
#pad(left: 1em)[ 
+ requisiti funzionali;

+ requisiti di qualità;

+ requisiti di vincolo;
]
- Assegnare a ciascun requisito:
#pad(left: 1em)[ 
+ un identificativo univoco;

+ una priorità (obbligatorio, desiderabile, opzionale);
]
- Formalizzare casi d’uso e requisiti nel documento di Analisi dei Requisiti (AdR);
- Associare ogni requisito a uno o più casi d’uso;
- Garantire la tracciabilità dei requisiti verso le successive attività di progettazione, codifica e verifica, come riportato in AdR e PdQ.

*Progettazione* \ 
-  Definire l’architettura generale del sistema sulla base dei requisiti approvati; 
- Individuare le componenti software e le loro responsabilità; 
- Definire le interfacce tra le componenti; 
- Aggiornare la documentazione di progetto in base alle decisioni architetturali;
- Verificare la coerenza tra requisiti definiti in AdR e le scelte progettuali;
-  Allineare le attività progettuali alla pianificazione definita nel Piano di Progetto (PdP). 

*Codifica* \ 
- Implementare le funzionalità secondo la progettazione approvata; 
- Applicare le convenzioni di stile e le buone pratiche definite nelle Norme di Progetto; 
- Utilizzare il sistema di versionamento per la gestione del codice;
-  Suddividere il lavoro in attività pianificate nel PdP e tracciate tramite issue;
- Eseguire controlli statici, formattazione automatica e verifiche preliminari del codice;
- Garantire la tracciabilità tra codice implementato e requisiti definiti in AdR. 
*Verifica e test* \ 
-  Definire i casi di test in conformità al Piano di Qualifica (PdQ);
- Eseguire test di unità sulle singole componenti software; 
- Eseguire test di integrazione tra le componenti; 
- Registrare l’esito dei test, le non conformità e le eventuali correzioni nel PdQ; 
- Verificare la copertura dei requisiti definiti in AdR attraverso i test eseguiti. 
*Integrazione e rilascio* \ 
- Integrare progressivamente le componenti software secondo la pianificazione del PdP; 
- Verificare il corretto funzionamento del sistema nel suo insieme; 
- Eseguire i test di qualifica di sistema previsti dal PdQ;
-  Preparare il materiale di rilascio e la documentazione associata;
-  Effettuare la consegna secondo le modalità e le scadenze concordate con la proponente. 
*Gestione delle modifiche* \
- Registrare le richieste di modifica come issue; 
- Valutare l’impatto delle modifiche sui requisiti (AdR) e sulla pianificazione (PdP); 
- Aggiornare la documentazione di progetto e il codice; 
- Eseguire nuovamente le verifiche previste dal PdQ; 
- Garantire il mantenimento della tracciabilità tra requisiti, codice e test. 

=== Documenti principali

Durante il processo di sviluppo, le attività sono supportate dalla documentazione di progetto già definita nel processo di fornitura (AdR, PdP, PdQ, NdP), con l’aggiunta di riferimenti specifici alle fasi di implementazione e verifica software.


=== Strumenti a supporto

Per lo sviluppo del software, il gruppo utilizza strumenti mirati a garantire qualità, tracciabilità e collaborazione:

- *Linguaggio e ambiente di sviluppo*: Python 3.x come linguaggio principale per le componenti software.

- *Versionamento del codice*: Git/GitHub per gestione dei repository, branch, commit, issue e pull request.

- *Formattazione e controllo del codice*: /*strumenti di formattazione automatica (ad esempio black) e linters (pylint, flake8) per verifiche preliminari della qualità del codice; configurazioni da definire e integrare nel workflow di sviluppo e nelle pipeline di CI/CD.*/ 
//da definire

- *Gestione attività e tracciamento*: GitHub Issues per assegnazione, monitoraggio e gestione delle modifiche.

- *Comunicazione e collaborazione interna*: Discord o WhatsApp per coordinamento rapido, aggiornamenti sullo stato di avanzamento e chiarimenti tra membri del gruppo.

- *Comunicazione verso la proponente*: email ufficiale, Zoom  per riunioni sincrone e Telegram per chiarimenti rapidi.


