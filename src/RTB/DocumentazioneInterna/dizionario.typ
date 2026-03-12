#let dict = (

  Requisito:[
    Rappresenta un'esigenza che il sistema deve soddisfare. Dal lato utente, è ciò di cui ha bisogno per raggiungere un obiettivo; dal lato tecnico, è una capacità che il sistema deve implementare per rispondere a tale esigenza. Può essere funzionale (cosa fa il sistema) o non funzionale (come lo fa).
  ],

  End-user:[
    L'utilizzatore finale del prodotto software, ovvero la persona che interagisce direttamente con il sistema nel contesto reale d'uso, distinta dal committente o dallo sviluppatore.
  ],

  Verifica:[
    Processo di controllo interno che assicura che il prodotto sia stato costruito correttamente rispetto alle specifiche definite. Risponde alla domanda: Stiamo costruendo il sistema nel modo giusto?
  ],

  Validazione:[
    Processo che assicura che il prodotto costruito corrisponda alle reali esigenze dell'utente finale. Risponde alla domanda: Stiamo costruendo il sistema giusto?
  ],

  "Piano di Qualifica":[
    Documento ufficiale che descrive le strategie, i criteri, le metriche e gli strumenti adottati dal team per svolgere le attività di verifica e validazione durante tutto il ciclo di vita del progetto.
  ],

  "Analisi dei Requisiti":[
    Processo strutturato di raccolta, analisi, classificazione e documentazione dei requisiti. Include interviste, casi d'uso e modellazione, con l'obiettivo di definire con precisione cosa il sistema deve fare prima di iniziare lo sviluppo.
  ],

  Attore:[
    Entità esterna (persona fisica, ruolo organizzativo o sistema esterno) che interagisce con il software in almeno un caso d'uso. Non fa parte del sistema, ma vi si interfaccia per raggiungere un obiettivo.
  ],

  UML:[
    Linguaggio di modellazione standardizzato (Unified Modeling Language) usato per rappresentare visualmente strutture, comportamenti e interazioni di un sistema software tramite diagrammi come casi d'uso, classi, sequenze e altri.
  ],

  "Caso d'uso":[
    Descrizione formale di un'interazione tra uno o più attori e il sistema, finalizzata al raggiungimento di un obiettivo specifico. Include precondizioni, scenario principale, scenari alternativi e postcondizioni.
  ],

  "Scenario principale":[
    La sequenza di passi ideale di un caso d'uso, quella che si verifica quando tutto va come previsto, senza errori o deviazioni dal flusso atteso.
  ],

  "Scenario secondario":[
    Sequenza alternativa che si attiva in caso di eccezioni, errori o condizioni particolari rispetto allo scenario principale. Definisce il comportamento del sistema nei casi non ordinari.
  ],

  "Ciclo di vita del progetto":[
    L'insieme ordinato delle fasi che scandiscono l'intero sviluppo di un prodotto software: dall'analisi iniziale alla progettazione, implementazione, test, rilascio e manutenzione.
  ],

  Backlog:[
    Lista ordinata di tutte le attività pianificate e non ancora avviate. Viene aggiornato continuamente durante il progetto e costituisce la fonte da cui si attingono i task per ogni sprint.
  ],

  Sprint:[
    Iterazione di sviluppo a durata fissa (nel progetto, bisettimanale) al termine della quale si produce un incremento verificabile del prodotto. È l'unità base del metodo Scrum.
  ],

  "Retrospettiva di Sprint":[
    Riunione che si svolge al termine di ogni sprint. Il team analizza cosa ha funzionato, cosa ha creato problemi e quali azioni intraprendere per migliorare nel ciclo successivo.
  ],

  Issue:[
    Unità atomica di lavoro tracciata nel sistema di versionamento. Può rappresentare un'attività, un bug, una feature o una modifica documentale, con stato, assegnatario e priorità associati.
  ],

  "Issue Tracking System":[
    Strumento digitale (come GitHub Issues) usato per pianificare, assegnare, monitorare e storicizzare le attività del progetto, mantenendo traccia dello stato di avanzamento di ciascuna issue.
  ],

  Milestone:[
    Punto di controllo significativo nella pianificazione del progetto, che segna il completamento di una fase o il raggiungimento di un obiettivo intermedio rilevante, come RTB o Product Baseline.
  ],

  "Ciclo PDCA":[
    Modello iterativo di miglioramento continuo articolato in quattro fasi: Plan (pianifica gli obiettivi), Do (esegui le attività), Check (verifica i risultati ottenuti), Act (applica le correzioni e riparte dal piano).
  ],

  Branch:[
    Ramificazione indipendente del repository Git usata per isolare lo sviluppo. Nel progetto si usano branch distinti per produzione (Main), sviluppo integrato (Develop) e singole funzionalità (Feature).
  ],

  "Pull Request":[
    Richiesta formale di integrare le modifiche sviluppate su un branch secondario nel branch principale. Prevede revisione e approvazione da parte di uno o più membri del team prima che il merge venga eseguito.
  ],

  Merge:[
    Operazione che unisce il codice di un branch secondario approvato nel branch di destinazione, rendendo effettive le modifiche nel progetto principale.
  ],

  "Workflow documentale":[
    Modello a stati che governa il ciclo di vita di ogni documento: Backlog → In lavorazione → In verifica → In validazione → Done, garantendo un processo controllato e tracciabile per ogni prodotto documentale.
  ],

  "Definition of Done":[
    Insieme di criteri verificabili e condivisi dal team che determinano quando un'attività può essere considerata formalmente completata, evitando ambiguità sul concetto di finito.
  ],

  "Proof of Concept":[
    Prototipo sperimentale sviluppato per validare la fattibilità di una tecnologia, un'integrazione o un approccio architetturale, prima di procedere con lo sviluppo completo del sistema.
  ],

  "Requirement and Technology Baseline":[
    Prima milestone formale del progetto, che comprende il completamento dell'Analisi dei Requisiti, la definizione delle tecnologie adottate e le attività di prototipazione (PoC).
  ],

  "Product Baseline":[
    Milestone che segna il completamento della progettazione architetturale e della codifica del prodotto, includendo test, documentazione tecnica e tutto il necessario per il rilascio finale.
  ],

  "Responsabile Tecnico":[
    Ruolo con permessi avanzati all'interno del sistema, abilitato alla gestione, modifica e supervisione dei decision tree e delle configurazioni di sistema non accessibili agli utenti standard.
  ],

  "Tracciamento automatico":[
    Meccanismo che collega sistematicamente i casi d'uso ai requisiti corrispondenti tramite script dedicati, garantendo coerenza e completezza tra le specifiche e la documentazione prodotta.
  ],

  Docker:[
    Piattaforma di containerizzazione che consente di creare ambienti di esecuzione isolati e riproducibili, garantendo che il software si comporti in modo identico su qualsiasi macchina o sistema operativo.
  ],

  Poetry:[
    Strumento per la gestione delle dipendenze e degli ambienti virtuali in Python, che semplifica la dichiarazione, l'installazione e la risoluzione dei pacchetti necessari al progetto.
  ],

  MyPy:[
    Strumento di analisi statica per Python che verifica la correttezza dei tipi dichiarati nel codice senza eseguirlo, rilevando potenziali errori in fase di sviluppo.
  ],

  BearType:[
    Libreria Python che esegue il controllo dei tipi a runtime, verificando che i valori passati alle funzioni rispettino le annotazioni dichiarate durante l'effettiva esecuzione del programma.
  ],

  Ruff:[
    Linter e formatter per codice Python ad alte prestazioni, utilizzato per rilevare errori stilistici, violazioni di convenzioni e per formattare automaticamente il codice in modo uniforme.
  ],

  Typst:[
    Linguaggio di markup moderno utilizzato per la composizione tipografica dei documenti del progetto, pensato come alternativa a LaTeX con sintassi più semplice e compilazione più rapida.
  ],

  "GitHub Actions":[
    Sistema di integrazione e distribuzione continua (CI/CD) integrato in GitHub, utilizzato per automatizzare build, esecuzione di test e pubblicazione dei documenti ad ogni modifica del repository.
  ],

  "TurboScribe AI":[
    Strumento basato su intelligenza artificiale utilizzato per la trascrizione automatica delle riunioni, producendo verbali testuali a partire da registrazioni audio o video.
  ],

  "Indice di Gulpease":[
    Metrica italiana di leggibilità del testo che valuta la comprensibilità di un documento in base alla lunghezza media delle parole e delle frasi. Valori più alti indicano testi più leggibili.
  ],

  "Requirements Stability Index":[
    Metrica che misura quanto i requisiti rimangono stabili nel tempo, calcolando il rapporto tra requisiti modificati o eliminati e il totale dei requisiti definiti. Un valore alto indica buona stabilità.
  ],

  "Time Efficiency":[
    Metrica che misura l'efficienza temporale del team, calcolata come rapporto tra il tempo stimato per un'attività e il tempo effettivamente impiegato per completarla.
  ],

  "Earned Value":[
    Valore economico del lavoro effettivamente completato in un dato momento, espresso in termini di budget pianificato. Usato per misurare l'avanzamento reale del progetto.
  ],

  "Planned Value":[
    Valore economico del lavoro che avrebbe dovuto essere completato entro un dato momento secondo la pianificazione iniziale. Costituisce il riferimento temporale del progetto.
  ],

  "Actual Cost":[
    Costo reale sostenuto per completare il lavoro svolto fino a un determinato momento, indipendentemente da quanto era stato pianificato o dal valore prodotto.
  ],

  "Estimate at Completion":[
    Stima aggiornata del costo totale del progetto al suo completamento, ricalcolata tenendo conto delle performance attuali e dei costi già sostenuti.
  ],

  "Estimate to Complete":[
    Stima dei costi ancora necessari per completare il lavoro rimanente del progetto, calcolata a partire dallo stato attuale di avanzamento.
  ],

  "Cost Performance Index":[
    Indice di efficienza economica calcolato come rapporto EV/AC. Un valore maggiore di 1 indica che si sta producendo più valore di quanto si stia spendendo.
  ],

  "Schedule Performance Index":[
    Indice di rispetto delle tempistiche calcolato come rapporto EV/PV. Un valore maggiore di 1 indica che il progetto è in anticipo rispetto alla pianificazione.
  ],

  "To Complete Performance Index":[
    Indice che indica il livello di efficienza economica necessario per completare il progetto rispettando il budget residuo disponibile.
  ],

  "Code Smells":[
    Caratteristiche del codice sorgente che, pur non causando errori diretti, indicano possibili problemi strutturali o di manutenibilità e suggeriscono la necessità di un refactoring.
  ],

  "Cyclomatic Complexity":[
    Metrica che misura la complessità logica di un modulo software contando il numero di percorsi indipendenti nel flusso di controllo. Valori elevati indicano codice difficile da testare e manutenere.
  ],

  "Instability Index":[
    Indice compreso tra 0 e 1 che misura la stabilità di un modulo software in base al rapporto tra dipendenze in uscita e totale delle dipendenze. Valori vicini a 1 indicano alta instabilità.
  ],

  "Coefficient of Coupling":[
    Misura del grado di interdipendenza tra moduli software. Un accoppiamento elevato rende il sistema più rigido e difficile da modificare, testare o riutilizzare in modo indipendente.
  ],

  "Statement Coverage":[
    Metrica di copertura del codice che indica la percentuale di istruzioni eseguite durante i test automatici. Un valore alto riduce la probabilità che comportamenti non testati nascondano difetti.
  ],

  MVC:[
    Modello architetturale che separa un'applicazione in tre componenti: Model (dati e logica di business), View (interfaccia utente) e Controller (gestione delle interazioni tra i due).
  ],

  "Layered Architecture":[
    Architettura software che organizza il sistema in livelli funzionali distinti e sovrapposti (es. presentazione, logica applicativa, accesso ai dati), dove ogni livello interagisce solo con quello adiacente.
  ]

)

#metadata(dict) <dizionario>


#let abbr = (

  AdR:"Analisi dei Requisiti",
  NdP:"Norme di Progetto",
  PdP:"Piano di Progetto",
  PdQ:"Piano di Qualifica",
  MU:"Manuale Utente",
  DoD:"Definition of Done",
  PBI:"Product Backlog Item",
  PoC:"Proof of Concept",
  RTB:"Requirement and Technology Baseline",
  PB:"Product Baseline",
  ROF:"Requisito Obbligatorio Funzionale",
  RDF:"Requisito Desiderabile Funzionale",
  ROQ:"Requisito Obbligatorio di Qualità",
  ROV:"Requisito Obbligatorio di Vincolo",
  MPC:"Metrica di Qualità del Processo",
  MPD:"Metrica di Qualità del Prodotto",

  PV:"Planned Value",
  EV:"Earned Value",
  AC:"Actual Cost",
  SPI:"Schedule Performance Index",
  CPI:"Cost Performance Index",
  EAC:"Estimate at Completion",
  ETC:"Estimate to Complete",
  TCPI:"To Complete Performance Index",
  RSI:"Requirements Stability Index",
  BAC:"Budget at Completion"

)

#metadata(abbr) <abbreviazioni>