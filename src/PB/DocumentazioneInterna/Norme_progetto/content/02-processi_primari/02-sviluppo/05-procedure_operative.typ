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

==== Documenti principali

Durante il processo di sviluppo, le attività sono supportate dalla documentazione di progetto già definita nel processo di fornitura (AdR, PdP, PdQ, NdP), con l’aggiunta di riferimenti specifici alle fasi di implementazione e verifica software.