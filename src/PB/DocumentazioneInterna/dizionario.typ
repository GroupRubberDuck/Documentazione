#let dict = (

"EN 18031":[
    Standard tecnico europeo in tre parti che definisce i requisiti di sicurezza informatica per i dispositivi radio, associati agli articoli 3.3(d), 3.3(e) e 3.3(f) della Direttiva RED. Obbligatorio come norma armonizzata dal 1° agosto 2025.
  ], 

  RED:[
    Direttiva europea 2014/53/UE (Radio Equipment Directive) che regola la messa in commercio dei dispositivi radio nell'Unione Europea. Con l'adozione di EN 18031 come norma armonizzata, impone la verifica della conformità ai requisiti di sicurezza informatica.
  ],

  CSV:[
    Formato di file testuale (Comma-Separated Values) in cui i dati sono organizzati in righe e colonne separate da virgole. Utilizzato nel progetto come formato standard per l'importazione e l'esportazione di dati.
  ],

  XML:[
    Formato di file basato su marcatori gerarchici (eXtensible Markup Language) utilizzato per rappresentare dati strutturati. Utilizzato nel progetto come formato standard per l'importazione e l'esportazione di dati e modelli.
  ],

  JSON:[
    Formato di file testuale leggero (JavaScript Object Notation) basato su coppie chiave-valore e array. Utilizzato nel progetto come formato standard per l'importazione e l'esportazione di dati e modelli.
  ],

  PDF:[
    Formato di documento digitale (Portable Document Format) indipendente dalla piattaforma, utilizzato nel progetto per l'esportazione del report di conformità finale.
  ],

  Dashboard:[
    Interfaccia riepilogativa del sistema che mostra in modo aggregato lo stato di avanzamento della valutazione di un dispositivo, la lista degli asset associati e le informazioni generali del dispositivo in esame.
  ],

  Stakeholder:[
    Soggetto portatore di interesse rispetto al progetto software, che può influenzarne le scelte o esserne influenzato. Include committenti, utenti finali, sviluppatori e responsabili della qualità.
  ],

  Trigger:[
    Evento specifico o azione dell'attore che avvia l'esecuzione di un caso d'uso. Rappresenta la condizione che porta il sistema a entrare nel flusso descritto dallo scenario principale.
  ],

  Estensione:[
    Relazione UML tra casi d'uso, indicata con «extend», che descrive un comportamento opzionale che può aggiungersi al caso d'uso base al verificarsi di una condizione particolare.
  ],

  Inclusione:[
    Relazione UML tra casi d'uso, indicata con «include», che descrive una funzionalità obbligatoriamente eseguita come parte del caso d'uso che la include.
  ],

  Specializzazione:[
    Relazione tra casi d'uso in cui un caso d'uso figlio eredita le caratteristiche del caso d'uso padre e le estende con comportamenti più specifici, seguendo il principio di generalizzazione UML.
  ],

  "Security Asset":[
    Tipo di asset che rappresenta una risorsa del dispositivo rilevante per i requisiti di sicurezza informatica definiti dallo standard EN 18031, in particolare per gli aspetti di autenticazione e controllo degli accessi.
  ],

  "Network Asset":[
    Tipo di asset che rappresenta una risorsa del dispositivo relativa alle interfacce e funzionalità di rete, soggetta ai requisiti normativi EN 18031 riguardanti la protezione della rete.
  ],

  "Stato aggregato":[
    Valore sintetico calcolato dal sistema che rappresenta il risultato complessivo della valutazione di un dispositivo o di un asset, derivato dalla combinazione degli esiti dei singoli requisiti valutati.
  ],

  "In corso":[
    Stato di valutazione di un requisito che indica che la compilazione del relativo decision tree è stata avviata ma non ancora completata.
  ],

  Sospeso:[
    Stato di valutazione di un requisito che indica che la sua valutazione è bloccata perché almeno un requisito da cui dipende ha ottenuto l'esito Not Applicable.
  ],

  "Bozza operativa":[
    Rappresentazione temporanea in memoria delle modifiche apportate durante una sessione attiva, sia nelle sessioni di valutazione sia in quelle di modifica del modello. Le modifiche nella bozza diventano permanenti solo dopo un salvataggio esplicito sul sistema di permanenza.
  ],

  Anagrafica:[
    Insieme dei dati identificativi di base associati a un'entità del sistema, come nome, codice e descrizione. Utilizzata per dispositivi, asset, requisiti e modelli.
  ],

  "Versionamento semantico":[
    Convenzione per l'assegnazione dei numeri di versione strutturata in tre componenti: MAJOR (modifiche significative che invalidano valutazioni esistenti), MINOR (modifiche non significative a campi testuali) e PATCH (correzioni minori che non alterano la struttura né il contenuto del modello). Applicata dal sistema al salvataggio delle modifiche al modello.
  ],

  "Dipendenza circolare":[
    Condizione di errore che si verifica quando l'aggiunta di una dipendenza tra requisiti crea un ciclo chiuso (es. A dipende da B e B dipende da A). Il sistema rileva e blocca automaticamente questa condizione, mostrando il grafo delle dipendenze per evidenziare il percorso che genera il ciclo.
  ],

  "Scheletro":[
    Struttura del decision tree definita nel modello normativo, composta dall'insieme dei nodi e delle loro relazioni gerarchiche, indipendentemente dalle risposte inserite durante una sessione di valutazione. Uno scheletro è valido se ogni percorso termina in un nodo foglia.
  ],

  RObb:[
    Sigla che identifica un Requisito Obbligatorio Funzionale, ovvero una funzionalità che deve essere necessariamente presente nel prodotto per soddisfare le richieste della proponente.
  ],

  RDes:[
    Sigla che identifica un Requisito Desiderabile Funzionale, ovvero una funzionalità non obbligatoria ma che arricchisce il sistema con caratteristiche utili.
  ],

  ROpz:[
    Sigla che identifica un Requisito Opzionale Funzionale, ovvero una funzionalità aggiuntiva la cui implementazione è subordinata al completamento dei requisiti obbligatori.
  ],
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
  ],
  "Test di Sistema":[
    Verifica che il sistema nel suo complesso soddisfi i requisiti funzionali e non funzionali specificati, simulando scenari d'uso reali sull'applicazione integrata.
  ],
  "Test di Accettazione":[
    Verifica che il sistema soddisfi le aspettative dell'utente finale, validando i flussi operativi completi secondo scenari concordati con la proponente.
  ],
  "Test di Integrazione": [
  Verifica la corretta interazione tra componenti o moduli distinti del sistema, assicurandosi che le interfacce tra le parti si comportino come previsto.
],
"Test di Unità": [
  Verifica il comportamento di singole unità di codice in isolamento, come funzioni o classi, garantendo la correttezza della logica implementata.
],
"Decision Tree": [
  Struttura ad albero utilizzata per guidare la valutazione di un requisito normativo attraverso una sequenza di domande e risposte, fino a determinare un esito (pass, fail o not applicable).
],

"Nodo": [
  Elemento costitutivo del Decision Tree. Può essere un nodo di decisione, che contiene una domanda a cui l'utente deve rispondere, oppure un nodo foglia, che rappresenta l'esito finale della valutazione.
],

"Nodo foglia": [
  Nodo terminale del Decision Tree che non ha successori. Rappresenta l'esito finale della valutazione di un percorso: pass, fail o not applicable.
],

"Nodo di decisione": [
  Nodo intermedio del Decision Tree che contiene una domanda a cui l'utente deve rispondere per determinare il percorso successivo nella valutazione.
],

"Asset": [
  Risorsa o componente di un dispositivo soggetta a valutazione normativa. Ogni asset appartiene a una classe di asset definita dal modello normativo e contiene un insieme di requisiti da verificare.
],

"Modello normativo": [
  Struttura configurabile che definisce le classi di asset, i requisiti normativi e i relativi Decision Tree per uno specifico standard. Costituisce il riferimento su cui si basa la valutazione di un dispositivo.
],

"Sessione di valutazione": [
  Sessione di lavoro in cui un utente valuta un dispositivo rispetto a un modello normativo, compilando i Decision Tree associati ai requisiti e registrando evidenze e risposte.
],

"Standard normativo": [
  Insieme di regole e requisiti tecnici definiti da un ente regolatore (es. ISO, IEC) a cui un dispositivo deve conformarsi. Nel sistema viene rappresentato tramite un modello normativo configurabile.
],

"Classe di asset": [
  Categoria che raggruppa asset con caratteristiche comuni all'interno di un modello normativo. Definisce gli attributi condivisi dagli asset che vi appartengono.
],

"Evidenza": [
  Dato, documento o giustificazione fornita dall'utente a supporto della risposta assegnata a un nodo del Decision Tree durante la sessione di valutazione.
],

"Dipendenza": [
  Relazione tra requisiti che vincola l'ordine o la condizione di valutazione, indicando che un requisito dipende dall'esito o dalla presenza di un altro requisito.
],
"Conformità normativa": [
  Aderenza di un dispositivo ai requisiti definiti da uno standard normativo. Un dispositivo è conforme quando supera con esito positivo la valutazione di tutti i requisiti obbligatori previsti dal modello normativo di riferimento.
],

"Valutazione": [
  Processo di verifica della conformità di un dispositivo rispetto a un modello normativo, condotto compilando i Decision Tree associati a ciascun requisito e registrando evidenze a supporto delle risposte fornite.
],

"Dispositivo": [
  Oggetto fisico o sistema software sottoposto a valutazione normativa. Nel sistema è identificato da un insieme di attributi descrittivi quali nome, sistema operativo e descrizione.
],

"Firmware": [
  Software a basso livello integrato direttamente nell'hardware di un dispositivo, che ne controlla il funzionamento di base e le interazioni con i componenti fisici.
],

"Report di valutazione": [
  Documento generato al termine di una sessione di valutazione che riassume i risultati ottenuti, includendo lo stato di ciascun requisito valutato e le evidenze associate.
],

"Pass": [
  Esito positivo della valutazione di un requisito o di un nodo del Decision Tree, che indica che il dispositivo soddisfa pienamente il criterio verificato.
],

"Fail": [
  Esito negativo della valutazione di un requisito o di un nodo del Decision Tree, che indica che il dispositivo non soddisfa il criterio verificato.
],

"Not Applicable": [
  Esito che indica che un requisito o un nodo del Decision Tree non è applicabile al dispositivo in esame, in quanto le condizioni necessarie per la sua valutazione non sono presenti.
],

"Importazione": [
  Operazione che consente di caricare nel sistema dati strutturati provenienti da file esterni, come liste di asset in formato JSON, XML o CSV.
],

"Esportazione": [
  Operazione che consente di salvare i dati presenti nel sistema in un file esterno in uno dei formati supportati (JSON, XML, CSV, PDF), per condivisione o archiviazione.
],

"Versionamento dello standard": [
  Gestione delle versioni successive di un modello normativo nel tempo, che consente di tracciare le modifiche apportate allo standard e mantenere la compatibilità con le valutazioni precedenti.
],

"Modello di standard di default":[
  Indica il modello che l'applicazione deve associare a un dispositivo al momento della sua creazione nel sistema.
],

"Bivio decisionale":[
  Relazione strutturale che collega un nodo di decisione del decision tree ai suoi nodi figli, definendo i possibili percorsi di valutazione a partire da una risposta data.
],
"Wi-Fi":[
    Tecnologia di comunicazione wireless basata sullo standard IEEE 802.11 che consente la connessione a reti locali senza l'uso di cavi. Nel contesto del progetto, rappresenta una delle interfacce di rete soggette a valutazione normativa EN 18031.
  ],

  LTE:[
    Standard di comunicazione mobile a banda larga (Long-Term Evolution) che consente la trasmissione dati ad alta velocità su reti cellulari. Può costituire un'interfaccia di rete soggetta a valutazione normativa.
  ],

  Bluetooth:[
    Tecnologia di comunicazione wireless a corto raggio utilizzata per lo scambio di dati tra dispositivi. Nel contesto normativo EN 18031 può rappresentare un'interfaccia soggetta a valutazione.
  ],

  IoT:[
    Paradigma tecnologico (Internet of Things) che descrive reti di dispositivi fisici connessi a internet, capaci di raccogliere e scambiare dati. I dispositivi IoT sono tra i principali soggetti a valutazione secondo lo standard EN 18031.
  ],

  "Dispositivo radio":[
    Dispositivo elettronico che utilizza lo spettro radio per la comunicazione, soggetto alla Direttiva RED (2014/53/UE) e ai requisiti di sicurezza informatica definiti dallo standard EN 18031.
  ],

  "Norma armonizzata":[
    Standard tecnico europeo riconosciuto dalla Commissione Europea come riferimento per soddisfare i requisiti essenziali di una direttiva. Il rispetto di una norma armonizzata conferisce presunzione di conformità alla direttiva corrispondente.
  ],

  "Protezione della rete":[
    Dominio di sicurezza definito dall'articolo 3.3(d) della Direttiva RED, che richiede che i dispositivi radio non arrechino danno alle reti di comunicazione. Corrisponde alla prima parte dello standard EN 18031.
  ],

  "Protezione dei dati personali":[
    Dominio di sicurezza definito dall'articolo 3.3(e) della Direttiva RED, che richiede misure per garantire la riservatezza e l'integrità dei dati personali trattati dai dispositivi radio. Corrisponde alla seconda parte dello standard EN 18031.
  ],

  "Prevenzione delle frodi":[
    Dominio di sicurezza definito dall'articolo 3.3(f) della Direttiva RED, che richiede misure per ridurre il rischio di utilizzo fraudolento dei dispositivi radio. Corrisponde alla terza parte dello standard EN 18031.
  ],

  Conformità:[
    Aderenza di un prodotto, processo o sistema ai requisiti definiti da uno standard, una norma o una specifica tecnica. Nel progetto si riferisce alla conformità dei dispositivi radio allo standard EN 18031.
  ],

  "Valutazione di conformità":[
    Processo formale che verifica se un dispositivo soddisfa i requisiti normativi applicabili, producendo un esito documentato e tracciabile per ciascun requisito valutato.
  ],

  "Automated EN18031 Compliance Verification":[
    Nome del capitolato di progetto. Indica il sistema software sviluppato dal team GroupRubberDuck per automatizzare il processo di valutazione della conformità allo standard EN 18031.
  ],

  Cybersecurity:[
    Insieme di pratiche, tecnologie e processi volti a proteggere sistemi, reti e dati da accessi non autorizzati, attacchi informatici e danni. Lo standard EN 18031 definisce requisiti di cybersecurity specifici per i dispositivi radio.
  ],

  Interfaccia:[
    Punto di interazione tra il dispositivo e l'ambiente esterno, come una connessione di rete, un protocollo di comunicazione o un'API. Nel contesto normativo, le interfacce del dispositivo sono soggette a valutazione secondo EN 18031.
  ],

  "Editor grafico":[
    Componente dell'applicazione che consente la visualizzazione e la modifica interattiva della struttura dei decision tree tramite un'interfaccia grafica, senza richiedere la modifica diretta dei file sottostanti.
  ],

  Manutenzione:[
    Fase del ciclo di vita del software che comprende le attività di correzione, adattamento e miglioramento del sistema dopo il suo rilascio, per garantirne il corretto funzionamento nel tempo.
  ],

  "Requisito funzionale":[
    Requisito che descrive una funzione o un comportamento specifico che il sistema deve essere in grado di eseguire in risposta a determinati input o eventi.
  ],

  "Requisito non funzionale":[
    Requisito che descrive una proprietà o un vincolo del sistema, come prestazioni, sicurezza, usabilità o manutenibilità, senza riferirsi a una funzione specifica.
  ],

  "Applicazione desktop":[
    Software installato ed eseguito localmente sul sistema operativo di un computer, senza richiedere un browser o una connessione a server remoti per il suo funzionamento principale.
  ],

  "Soluzione web-based":[
    Applicazione accessibile tramite browser web, che non richiede installazione locale e può essere utilizzata da qualsiasi dispositivo connesso a internet.
  ],
  "Schema-flexible":[
    Caratteristica architetturale tipica dei database NoSQL orientati ai documenti (come MongoDB) che consente di memorizzare dati senza la necessità di definire a priori una struttura rigida. In un ambiente schema-flexible, documenti appartenenti alla medesima collezione possono presentare campi, tipi di dato e gerarchie (nidificazioni) differenti tra loro, garantendo un'elevata agilità nell'evoluzione del modello dati.
  ],
  "NoSQL":[
    *Not Only SQL*.

    Indica una categoria di sistemi di gestione di basi di dati che, a differenza dei tradizionali database relazionali, non utilizza un modello basato su tabelle, righe e colonne con schemi rigidi. Progettati per offrire elevata flessibilità e scalabilità orizzontale, i database NoSQL sono ottimizzati per la gestione di grandi volumi di dati eterogenei, non strutturati o semi-strutturati, utilizzando diversi modelli di archiviazione.
  ],
  "Database orientato ai documenti":[
      Specifica tipologia di database NoSQL progettata per memorizzare, recuperare e gestire informazioni sotto forma di documenti (tipicamente formattati in JSON, BSON o XML). A differenza dei database relazionali, in cui le informazioni sono distribuite su più tabelle normalizzate, in questo modello tutti i dati correlati a una singola entità logica vengono incapsulati all'interno di un unico documento gerarchico. Questo approccio favorisce l'adozione di un design Schema-flexible e si allinea in modo naturale con le strutture dati dei moderni linguaggi di programmazione.
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
  BAC:"Budget at Completion",
  TS: "Test di Sistema",
  TA: "Test di Accettazione",
  TI: "Test di Integrazione",
  TU: "Test di Unità",
  NI: "Non Implementato",
  DT: "Decision Tree",
  JSON: "JavaScript Object Notation",
  XML: "eXtensible Markup Language",
  CSV: "Comma-Separated Values",
  AU: "Assessment Unit",
  DN: "Decision Node",
UML: "Unified Modeling Language",
RObb: "Requisito Obbligatorio Funzionale",
RDes: "Requisito Desiderabile Funzionale",
ROpz: "Requisito Opzionale Funzionale",
PDF: "Portable Document Format",
RED: "Radio Equipment Directive",
BT: "Bluetooth",
IoT: "Internet of Things",
LTE: "Long-Term Evolution",

)

#metadata(abbr) <abbreviazioni>