#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#import "../../DocumentazioneInterna/Glossario.typ" : dict
#set text(size: 13pt)

#set heading(numbering: "1.1) ")
// Level 1 headings: leggermente più grandi, stesso font, nero bold
#show heading.where(level: 1): set text(
  size: 24pt,      
  weight: "bold",  
)


// Level 2 headings: leggermente più piccoli, grigio scuro, stesso font
#show heading.where(level: 2): set text(
  size: 18pt,     
)
#show ref: body => underline()[*#body*]
#show link: body => {
  set text(fill: blue)
  underline()[#body]
}


#let doc="Analisi dei requisiti"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In review",
    versione: "0.6",
    autori: ("Felician Necsulescu", "Ana Maria Draghici"),
    verificatori:("Davide Lorenzon",),
    uso: "Esterno",
    destinatari: ("Team di progetto, Bluwind S.r.l",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  
  ([0.1.0],[2025-11-11],[Aldo Bettega],[Davide Lorenzon],[Creazione del documento]),
  ([0.2.0],[2025-11-12],[Felician Necsulescu],[Ana Maria Draghici],[Stesura sezione introduzione e descrizione generale]),
  ([0.3.0],[2025-11-13],[Felician Necsulescu],[Davide Lorenzon],[Scrittura del primo caso d'uso UC1]),
  ([0.4.0],[2025-11-15],[Ana Maria Draghici],[Davide Lorenzon],[Aggiunta @sec-scopo-doc  @sec-contesto, @sec-caso_studio , e modificata introduzione/descrizione generale]),
  ([0.5.0],[2025-11-18],[Ana Maria Draghici],[Davide Lorenzon],[Modificate le sezioni riguardanti utenti e piattaforma: @sec-utenti e @sec-piattaforma in seguito all’incontro esterno con Bluewind]),
  ([0.6.0],[2025-11-28],[Felician Mario Necsulescu],[Davide Lorenzon],[Scrittura dei casi d'uso: UC1.1, UC2, UC2.1, UC3, UC3.1, UC4, UC5, UC6, UC7]),
)

#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))





]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
= Introduzione <sec-intro>

Il presente documento di Analisi dei Requisiti  costituisce un elemento fondamentale per lo sviluppo del progetto software “Automated EN18031 Compliance Verification", commissionato da Bluewind S.r.l., e rappresenta la base su cui poggia l’intero processo di progettazione e implementazione del sistema.

Questo documento è stato redatto con l’intento di fornire una trattazione chiara  dei requisiti e dei casi d’uso  individuati dal team di sviluppo. La raccolta di questi dati è il risultato di un’analisi approfondita del #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[capitolato d'appalto C1 - Automated EN18031 Compliance Verification], di discussioni interne al gruppo di lavoro e di colloqui con i referenti aziendali, in particolare Tobia Fiorese e Alessandro Zappia.

Il documento esplicita le funzionalità che il prodotto finale deve offrire e identifica i vincoli tecnici e operativi entro cui il sistema deve operare. 

I casi d’uso sono documentati secondo la notazione UML  e comprendono nome, attori principali, precondizioni, trigger, scenario principale e scenari alternativi. Queste informazioni permettono di rappresentare in modo chiaro le interazioni tra utenti e sistema, facilitando lo sviluppo, i test e la manutenzione futura.


  
==  Scopo del documento <sec-scopo-doc>

Gli obiettivi principali di questo documento sono:
#pad(left: 1em)[
- Fornire una descrizione chiara e dettagliata dei *requisiti funzionali* #footnote()[#dict.at("Requisito funzionale")] *e non funzionali* #footnote()[#dict.at("Requisito non funzionale")] del sistema;
- Presentare i *casi d’uso principali*  , con indicazione degli attori coinvolti, scenari principali e scenari alternativi;
- Consentire la *tracciabilità dei requisiti*  rispetto ai casi d’uso e alle possibili estensioni future del sistema;
- Fornire un *riferimento* per sviluppatori, tester e manutentori per comprendere le funzionalità del sistema e le condizioni operative;
- Supportare la *gestione delle modifiche e degli aggiornamenti dei requisiti* nel corso del ciclo di vita del progetto.
]

== Scopo del prodotto 
Il prodotto è un’applicazione software per la verifica automatizzata della conformità alla norma EN18031, uno standard tecnico europeo per la sicurezza informatica dei dispositivi radio (Wi-Fi , LTE , BT , IoT wireless ). 

L’obiettivo è guidare l’utente nella valutazione dei requisiti di cybersecurity  attraverso l’esecuzione strutturata dei decision tree normativi, velocizzando e standardizzando il processo di verifica della conformità e generando la documentazione necessaria. 
== Glossario // mettere link al glossario
Per garantire precisione terminologica senza compromettere la leggibilità, in questo documento viene adottato un approccio ibrido alla gestione dei riferimenti al Glossario.
I termini tecnici possono essere presentati secondo 2 modalità:

- *Footnote al primo utilizzo*: applicata ai concetti critici o potenzialmente ambigui, permette un accesso immediato alla definizione senza interrompere il flusso logico del testo.

- *Marcatura tramite pedice “G” (esempio#sub("G"))*: utilizzata per termini ricorrenti o già contestualizzati, indica semplicemente la presenza del termine nel Glossario.
  
Questo sistema consente di mantenere il documento tecnicamente rigoroso, chiaro e facilmente navigabile, favorendo la consultazione mirata del Glossario solo quando necessario.
// Da rivedere, l'uso del glossario è ancora da definire meglio, quindi questa è solo un'idea generale, non definitiva. 
 
== Miglioramenti del documento
Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da: 

- *Team di sviluppo*: in caso di ambiguità o necessità di chiarimenti tecnici; 

- *Azienda proponente*: per integrazioni o modifiche ai requisiti. 

Le modifiche sostanziali ai requisiti comportano l’incremento della versione principale (es. da 1.0 a 2.0), mentre correzioni minori o chiarimenti incrementano la versione secondaria (es. da 1.0 a 1.1). 

*Nota*: fino al completamento della fase di analisi, non può essere garantita la stabilità dei requisiti. Data la natura iterativa del processo, i requisiti presentati riflettono lo stato attuale dell’analisi e potranno essere soggetti a revisione in seguito a chiarimenti o nuovi incontri con la proponente.

 == Riferimenti  
  === Riferimenti normativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_progetto.pdf")[Norme di Progetto v.0.0.1];\ 
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Regolamento del progetto didattico]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \
    - #inserisciLink(url:"https://www.evs.ee/en/evs-en-18031-1-2024")[European Standard EN18031]
  ]
  === Riferimenti informativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf")[Glossario v.0.0.1]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf")[Diagrammi dei casi d'uso]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Analisi dei requisiti ];\
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/")[Verbali interni]; \
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/")[Verbali esterni]; \
    - #inserisciLink(url:"https://drive.google.com/file/d/1irvFvrXyRsF3ELZAuNre4y3bLHFmszvz/view?usp=sharing")[Software Engineering, Sommerville, edizione X]
    - #inserisciLink(url:"https://github.com/zealience/IoT-Cybersecurity-Compliance")[IoT-Cybersecurity-Compliance]
  
  
  ]
]


#insertArabicNumberedPagesSenzaData(PageTitle: "Descrizione generale", documentType: doc)[
  = Descrizione generale <sec-descrizione_generale>
== Contesto e problema <sec-contesto>
La recente pubblicazione dello standard tecnico EN 18031 come norma armonizzata  per la Direttiva RED (2014/53/UE)  ha reso obbligatoria, dal 1 agosto 2025, la verifica della conformità dei dispositivi radio ai requisiti di sicurezza informatica previsti dagli articoli 3.3(d), 3.3(e) e 3.3(f). Lo standard è articolato in tre parti, ciascuna associata a specifici domini di sicurezza (protezione della rete, protezione dei dati personali, prevenzione delle frodi) e descrive una vasta serie di requisiti da valutare tramite decision tree gerarchici.

L’attuale processo manuale di verifica — basato sulla lettura approfondita della norma, sulla valutazione ripetitiva di molteplici requisiti e sulla creazione di documentazione — risulta lungo, soggetto a errori e difficilmente tracciabile. Di conseguenza, è necessario uno strumento software che supporti l’automazione, la standardizzazione e la tracciabilità dell’intero processo di valutazione.

  == Obiettivi del prodotto
L’obiettivo principale del prodotto è fornire uno strumento che semplifichi e renda affidabile il processo di valutazione della conformità alla norma EN 18031.\
Il sistema deve centralizzare le informazioni tecniche sui dispositivi, guidare l’utente nella compilazione dei decision tree in modo strutturato e coerente, e produrre risultati di conformità chiari e completamente tracciabili. Inoltre, deve offrire strumenti per visualizzare e aggiornare sia i decision tree sia la documentazione associata, supportando un processo di verifica più efficiente, standardizzato e facilmente mantenibile.

== Funzioni del prodotto

Le funzioni principali che l'applicazione consentirà agli utenti includono:

#pad(left: 1em)[
- *Importazione e gestione dei documenti tecnici*: possibilità di caricare file in formati standard (CSV, XML, JSON)  contenenti informazioni sui dispositivi, le interfacce, le funzionalità e le configurazioni di rete. (asset relativi al dispositivo da valutare)

- *Importazione e gestione dei decision tree*: possibilità di importare decision tree strutturati (XML, JSON) che rappresentano i requisiti normativi, con nodi e percorsi gerarchici. 

- *Esecuzione guidata dei decision tree*: presentazione interattiva delle domande contenute nei decision tree, con logica di navigazione basata sulle risposte precedenti (Yes/No), garantendo una valutazione ripetibile e tracciabile dei requisiti. Durante l’esecuzione, il sistema considera anche la gerarchia dei requisiti e le interazioni tra i nodi, permettendo di valutare l’influenza reciproca delle decisioni e di rispettare le dipendenze tra i requisiti.

- *Valutazione automatizzata della conformità*: determinazione automatica dei risultati per ciascun requisito secondo gli esiti standard (Not Applicable, Pass, Fail), con registrazione completa del processo decisionale.

- *Visualizzazione e navigazione dei decision tree*: dashboard interattiva che mostra lo stato di avanzamento delle valutazioni e la conformità dei dispositivi, con rappresentazione grafica dei decision tree e evidenziazione dei percorsi seguiti durante la valutazione. 
//L’utente può filtrare, aggregare e comprendere facilmente i risultati, garantendo trasparenza e tracciabilità delle decisioni.

- *Modifica dei decision tree*: editor grafico  integrato per adattare e aggiornare i percorsi decisionali, con salvataggio dei file modificati in formati standard.

- *Gestione della documentazione associata*: possibilità di aggiornare e modificare i documenti tecnici importati, mantenendo la tracciabilità delle modifiche.

- *Esportazione dei risultati (opzionale)*: generazione di report chiari e completi in diversi formati (PDF, CSV, JSON, XML) contenenti i risultati delle verifiche e le motivazioni associate.

- *Annotazioni e giustificazioni (opzionale)*: possibilità di aggiungere note esplicative per documentare le decisioni prese e migliorare la tracciabilità.
]
  == Caratteristiche degli utenti <sec-utenti>

L’applicazione supporta diversi profili di utenti coinvolti nella verifica della conformità dei dispositivi radio:
#pad(left: 1em)[
- *Tecnici di conformità* (principali): eseguono decision tree interattivi, importano documenti tecnici, rispondono a domande strutturate e visualizzano risultati chiari (Pass/Fail/Not Applicable), riducendo i tempi e gli errori tipici del processo manuale.

- *Responsabili qualità e compliance* (opzionali): monitorano lo stato complessivo delle valutazioni, accedono ai risultati aggregati e generano report per garantire tracciabilità e supervisione delle decisioni prese.

- *Nuovi membri del team* (opzionali): utilizzano strumenti grafici per familiarizzare con la struttura dei requisiti e con il processo di valutazione, accelerando la formazione sul sistema.
]
Gli *utenti principali* del sistema sono i tecnici interni di conformità, mentre le altre categorie ricoprono ruoli di supporto o supervisione.
  == Piattaforma di esecuzione <sec-piattaforma>

Il sistema sarà sviluppato come applicazione software, con possibilità di scelta tra una soluzione *web-based* o *desktop*.

Dall’incontro con l’azienda è emerso che *non esiste una preferenza vincolante*, anche se viene suggerita la soluzione web-based per una maggiore flessibilità, la facilità di accesso senza installazione e la possibilità di lavorare con il file system locale quando necessario.
È stato inoltre chiarito che, nel caso di una soluzione desktop, non è necessario garantire la compatibilità con tutti i sistemi operativi, poiché sarebbe sufficiente supportarne uno solo (preferibilmente Linux).

L’obiettivo rimane garantire un’applicazione accessibile, flessibile e fruibile dagli utenti finali, senza vincoli significativi legati alla piattaforma utilizzata.
== Caso studio fornito - Panoramica <sec-caso_studio>
Per la verifica e il collaudo del sistema sarà fornito un caso studio reale, rappresentato da una macchina del caffè connessa in rete via Wi-Fi. \
Questo esempio permette di testare l’applicazione in un contesto operativo concreto, valutando i requisiti di accesso e autenticazione dei dispositivi, e di verificare il corretto funzionamento dei decision tree e della generazione dei risultati.

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Casi d'uso", documentType: doc)[
  

  = Casi d'uso

  == Scopo

  Lo scopo di questa sezione è descrivere in dettaglio i casi d’uso individuati dal gruppo, al fine di rappresentare le funzionalità principali del sistema di verifica della conformità allo standard EN 18031. Per garantire una rappresentazione formale e comprensibile a tutti gli stakeholder del progetto, il documento adotta la notazione UML per la descrizione dei casi d'uso, ognuno dei quali è descritto seguendo una struttura logica rigorosa che comprende:

  #pad(left: 1em)[
    - *Nominativo*: identificativo univoco e descrittivo del caso d'uso;\
    - *Attori Principali*: soggetti (umani o sistemi esterni) che interagiscono con il sistema;\
    - *Precondizioni*: stato del sistema prima dell'esecuzione del caso d'uso;\
    - *Trigger*: identifichiamo l'evento specifico o l'azione dell'attore che avvia l'esecuzione del caso d'uso.\
    - *Postcondizioni*: stato del sistema al termine dell'esecuzione del caso d'uso;\
    - *Scenario principale*: si mostra passo dopo passo la sequenza di interazioni tra attori e sistema che caratterizza il flusso di esecuzione normale, mostrando come si passa dalle condizioni iniziali al risultato finale;\
    - *Scenari alternativi*: documentiamo i percorsi di esecuzione che si discostano dal flusso normale e le situazioni in cui l'esecuzione regolare viene interrotta a causa di condizioni anomale o scelte diverse dell'utente;\
    - *Estensioni*: eventuali estensioni o generalizzazioni del caso d'uso;\
    - *Sottocasi d'Uso*: quando necessario, identifichiamo dei sottocasi che seguono la medesima struttura documentale e vengono referenziati tramite una numerazione gerarchica nella forma X.Y, dove X rappresenta il caso d'uso principale e Y un identificativo progressivo del sottocaso;\
    - *Casi che Ereditano*: elenchiamo i casi d'uso che estendono il caso d'uso corrente, ereditandone tutte le caratteristiche e aggiungendone di specifiche;\
    - *Eredita da*: specifichiamo il caso d'uso padre dal quale il caso d'uso corrente deriva le proprie funzionalità di base.
  ]

  == Attori

  L'applicazione prevede la presenza di un Attore principale:

  - *Utente*: Persona che utilizza l'applicazione per effettuare la verifica della conformità dei dispositivi radio allo standard EN 18031. L'utente interagisce direttamente con il sistema attraverso l'interfaccia grafica, importa i documenti tecnici, risponde alle domande dei decision tree, visualizza i risultati delle valutazioni e gestisce la documentazione associata. 

== Lista casi d'uso

=== UC1: Importazione documenti tecnici del dispositivo

#figure(
  image("immagini/UC1.png", width: 80%),
  caption: [Importazione documenti tecnici del dispositivo]
)
- *Attori Principale*: Utente;
- *Precondizioni*: L'utente ha avviato l'applicazione e si trova nella schermata principale;
- *Postcondizioni*: I documenti tecnici sono stati caricati correttamente nel sistema e sono disponibili per l'elaborazione;
- *Trigger*: L'utente seleziona l'opzione per importare i documenti tecnici;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente accede alla funzionalità di importazione documenti;
    2. Il sistema mostra l'interfaccia di selezione dei file;
    3. L'utente seleziona uno o più file nei formati supportati;
    4. Il sistema carica i documenti e li memorizza;
    5. Il sistema mostra un messaggio di conferma dell'avvenuta importazione;
    6. Il sistema visualizza un riepilogo delle informazioni importate.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC1.1*: File di ingresso non valido per formato.
]

  ==== UC1.1: File di ingresso non valido
/*#figure(
  image("immagini/UC1.1.png", width: 80%),
  caption: [File di ingresso non valido]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un file per l'importazione;
- *Postcondizioni*: L'utente viene informato dell'errore e può tentare una nuova importazione;
- *Trigger*: Il sistema tenta di leggere il file selezionato;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. Il sistema tenta di aprire il file selezionato;
    2. Il sistema rileva che il file non rispetta il formato previsto;
    3. Il sistema notifica l'errore all'utente con un messaggio dettagliato;
    4. Il sistema suggerisce all'utente di verificare il formato del file;
    5. L'utente può tentare nuovamente l'importazione (*UC1*).
]

=== UC2: Importazione dei decision tree
/*#figure(
  image("immagini/UC2.png", width: 80%),
  caption: [Importazione dei decision tree]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: L'utente ha avviato l'applicazione e caricato correttamente i documenti tecnici del dispositivo;
- *Postcondizioni*: Tutti i decision tree sono stati caricati correttamente e sono disponibili per l'esecuzione;
- *Trigger*: L'utente seleziona l'opzione per importare i decision tree;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente accede alla funzionalità di importazione decision tree;
    2. Il sistema mostra l'interfaccia di selezione dei file;
    3. L'utente seleziona uno o più file contenenti decision tree nei formati supportati (XML, JSON);
    4. Il sistema valida la struttura di ciascun decision tree verificando:
        - Correttezza del formato (XML/JSON ben formato);
        - Coerenza delle dipendenze tra nodi;
        - Validità degli esiti finali (Pass, Fail, Not Applicable);
    5. Il sistema carica i decision tree e li associa ai rispettivi requisiti;
    6. Il sistema rende disponibili i decision tree nell'area di lavoro;
    7. Il sistema mostra un messaggio di conferma dell'avvenuta importazione.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC2.1*: Errore nel caricamento di un decision tree.
]

==== UC2.1: Errore nel caricamento di un decision tree
/*#figure(
  image("immagini/UC2.1.png", width: 80%),
  caption: [Errore nel caricamento di un decision tree]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: Il sistema sta tentando di importare uno o più decision tree;
- *Postcondizioni*: L'utente visualizza un messaggio di errore dettagliato e può tentare una nuova importazione;
- *Trigger*: Si verifica un errore durante la lettura o validazione di un file;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. Il sistema tenta di leggere un file XML/JSON contenente un decision tree;
    2. Il sistema rileva un errore di parsing, formato non valido o struttura incompleta;
    3. Il sistema identifica la tipologia di errore;
    4. Il sistema mostra un messaggio di errore dettagliato all'utente specificando:
        - Il file che ha causato l'errore;
        - La natura dell'errore riscontrato;
    5. Il sistema suggerisce all'utente di verificare e correggere il file, quindi importarlo nuovamente(*UC2*).
]

=== UC3: Avvio dell'esecuzione di un decision tree
/*#figure(
  image("immagini/UC3.png", width: 80%),
  caption: [Avvio dell'esecuzione di un decision tree]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: I decision tree sono stati importati correttamente nel sistema;
- *Postcondizioni*: L'utente ha avviato la compilazione delle domande del decision tree selezionato;
- *Trigger*: L'utente seleziona un requisito dalla dashboard;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente apre la dashboard dei requisiti;
    2. L'utente seleziona un requisito specifico (es. AUM-5-1);
    3. Il sistema verifica se il requisito selezionato ha dipendenze da altri requisiti;
    4. Il sistema controlla lo stato dei requisiti prerequisiti;
    5. Se tutti i prerequisiti sono soddisfatti (Pass o Not Applicable), il sistema carica il decision tree associato;
    6. Il sistema apre una schermata dedicata alla compilazione del decision tree;
    7. Il sistema mostra la prima domanda del decision tree;
    8. L'utente seleziona una risposta tra "Yes" o "No";
    9. Il sistema naviga automaticamente al nodo successivo in base alla risposta.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC3.1*: Prerequisiti non soddisfatti - il sistema notifica all'utente quali requisiti devono essere completati prima di procedere .
]

==== UC3.1: Prerequisiti non soddisfatti
/*#figure(
  image("immagini/UC3.1.png", width: 80%),
  caption: [Prerequisiti non soddisfatti]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un requisito che ha dipendenze da altri requisiti;
- *Postcondizioni*: L'utente è informato sui prerequisiti mancanti e non può avviare il decision tree;
- *Trigger*: Il sistema rileva che uno o più requisiti prerequisiti non sono stati completati;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. Il sistema verifica le dipendenze del requisito selezionato;
    2. Il sistema rileva che uno o più requisiti prerequisiti non sono nello stato Pass o Not Applicable;
    3. Il sistema mostra un messaggio all'utente indicando quali requisiti devono essere completati prima;
    4. Il sistema evidenzia nella dashboard i requisiti prerequisiti mancanti;
    5. L'utente può selezionare uno dei requisiti prerequisiti per completarlo.
]

=== UC4: Completamento dell'esecuzione di un decision tree
/*#figure(
  image("immagini/UC4.png", width: 80%),
  caption: [Completamento dell'esecuzione di un decision tree]
)*/
- *Attori Principale*: Sistema;
- *Precondizioni*: L'utente ha risposto a tutte le domande del decision tree seguendo il percorso decisionale;
- *Postcondizioni*: Viene generato l'esito finale del requisito (Pass, Fail o Not Applicable) e lo stato viene aggiornato nella dashboard;
- *Trigger*: L'ultimo nodo del percorso decisionale viene raggiunto;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. Il sistema rileva che il nodo finale è stato raggiunto;
    2. Il sistema legge l'esito associato al nodo finale (Pass, Fail o Not Applicable);
    3. Il sistema salva l'esito del requisito;
    4. Il sistema mostra all'utente l'esito finale con un messaggio esplicativo;
    5. Il sistema aggiorna lo stato del requisito nella dashboard;
    6. Il sistema notifica all'utente eventuali nuovi requisiti dipendenti disponibili.
]

=== UC5: Visualizzazione della dashboard dei requisiti
/*#figure(
  image("immagini/UC5.png", width: 80%),
  caption: [Visualizzazione della dashboard dei requisiti]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: I decision tree sono stati importati nel sistema e associati ai rispettivi requisiti;
- *Postcondizioni*: L'utente visualizza lo stato completo di tutti i requisiti e può interagire con essi;
- *Trigger*: L'utente apre la dashboard dell'applicazione;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente accede alla dashboard dell'applicazione;
    2. Il sistema recupera lo stato di tutti i requisiti caricati;
    3. Il sistema mostra la lista completa dei requisiti in formato strutturato;
    4. Per ogni requisito, il sistema visualizza:
        - Codice identificativo del requisito (es. AUM-5-1);
        - Stato corrente: Non iniziato, In corso, Pass, Fail, Not Applicable;
        - Eventuali dipendenze da altri requisiti;
        - Indicatore di disponibilità per l'esecuzione;
    5. Il sistema evidenzia visivamente i requisiti in base al loro stato (es. colori diversi);
    6. L'utente può filtrare o ordinare i requisiti per stato o codice;
    7. L'utente può selezionare un requisito disponibile per avviarne l'esecuzione;
    8. L'utente può accedere all'editor grafico per visualizzare o modificare un decision tree.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC3*: L'utente seleziona un requisito per avviarne l'esecuzione;
    2. *UC6*: L'utente apre l'editor grafico per visualizzare o modificare un decision tree.
]

=== UC6: Modifica di un decision tree tramite editor grafico
/*#figure(
  image("immagini/UC6.png", width: 80%),
  caption: [Modifica di un decision tree tramite editor grafico]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un decision tree dalla dashboard;
- *Postcondizioni*: Le modifiche al decision tree vengono salvate e il decision tree aggiornato è disponibile per l'esecuzione;
- *Trigger*: L'utente apre l'editor grafico per visualizzare o modificare un decision tree;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente accede all'editor grafico dalla dashboard;
    2. Il sistema carica la rappresentazione grafica del decision tree selezionato;
    3. Il sistema visualizza la struttura ad albero con tutti i nodi, domande e percorsi;
    4. L'utente naviga visualmente il decision tree;
    5. L'utente modifica elementi del decision tree:
        - Testi delle domande;
        - Nodi decisionali;
        - Dipendenze e percorsi tra nodi;
        - Esiti finali (Pass, Fail, Not Applicable);
    6. L'utente seleziona l'opzione di salvataggio;
    7. Il sistema richiede il formato desiderato (XML o JSON);
    8. Il sistema valida la struttura modificata del decision tree;
    9. Il sistema genera il file nel formato selezionato;
    10. Il sistema salva il decision tree modificato nel file system locale;
    11. Il sistema conferma il salvataggio all'utente.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC6.1*: La struttura modificata presenta errori di validazione - il sistema evidenzia gli errori e impedisce il salvataggio;
]

=== UC7: Esportazione dei risultati
/*#figure(
  image("immagini/UC7.png", width: 80%),
  caption: [Esportazione dei risultati]
)*/
- *Attori Principale*: Utente;
- *Precondizioni*: L'esecuzione di almeno un decision tree è stata completata;
- *Postcondizioni*: Il file contenente i risultati è stato generato e salvato nel formato selezionato;
- *Trigger*: L'utente richiede l'esportazione dei risultati;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente accede al menù "Esporta risultati";
    2. Il sistema mostra le opzioni di formato disponibili (PDF, CSV, JSON);
    3. L'utente seleziona il formato desiderato per l'esportazione;
    4. Il sistema raccoglie tutti i risultati delle esecuzioni completate;
    5. Il sistema genera il file nel formato selezionato;
    6. Il sistema salva il file sul file system locale;
    7. Il sistema notifica all'utente il completamento dell'esportazione e la posizione del file. 
]
]