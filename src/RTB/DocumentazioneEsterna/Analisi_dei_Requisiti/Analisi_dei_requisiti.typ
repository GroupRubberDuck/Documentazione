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

// 
//Info del documento 
// 
#let doc="Analisi dei requisiti"
#let currentVersion=(
  major:0,
  minor:7,
  patch:1,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In review",
    versione: versionNumber,
    autori: ("Felician Necsulescu", "Ana Maria Draghici","Davide Lorenzon"),
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
  ([0.6.1],[2025-12-6],[Felician Mario Necsulescu],[Davide Lorenzon],[Modifica dei casi d'uso in seguito alla riunione con Bluewind]),
  ([0.7.0],[2025-12-6],[Felician Mario Necsulescu],[Davide Lorenzon],[Scrittura dei casi d'uso: UC8, UC9, UC10]),
  ([0.7.1],[2025-12-07],[Davide Lorenzon],[],[Aggiunto editing degli asset ai documenti tecnici ai casi d'uso.]),
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
  #include "content/Use_case.typ"

]