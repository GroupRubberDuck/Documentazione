#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#set text(size: 13pt)
// #set par(justify: true)
#set heading(numbering: "1.1)")

#let doc="Analisi dei requisiti"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In review",
    versione: "0.1",
    autori: ("Felician Necsulescu",),
    revisori:("-",),
    validatori: ("-",),
    uso: "Esterno",
    destinatari: ("Team di progetto, Bluwind S.r.l",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  
  ([0.1],[2025-11-11],[Creazione del documento],[Aldo Bettega],[-],[-]),
  ([0.2],[2025-11-12],[Stesura sezione introduzione e descrizione generale],[Felician Necsulescu],[-],[-]),
  ([0.3],[2025-11-13],[Aggiunta UC1],[Felician Necsulescu],[-],[-]),
  
)

#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  Il presente documento di Analisi dei Requisiti costituisce un elemento fondamentale per lo sviluppo del progetto software "Automated EN18031 Compliance Verification", commissionato da Bluewind S.r.l., e rappresenta la base su cui poggia l'intero processo di progettazione e implementazione del sistema.
  Questo documento è stato redatto con l'intento di fornire una trattazione esaustiva e dettagliata dei requisiti e dei casi d'uso individuati dal team di sviluppo. La raccolta di questi dati è il risultato di un'analisi approfondita del #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[capitolato d'appalto C1 - Automated EN18031 Compliance Verification];  fornito da Bluewind S.r.l., di discussioni interne al gruppo di lavoro e di colloqui attivi con i referenti aziendali, in particolare con Tobia Fiorese e Alessandro Zappia. L'obiettivo è garantire una comprensione completa e accurata delle necessità del committente, stabilendo una base solida e condivisa per tutte le successive fasi di sviluppo. Inoltre esplicita le funzionalità che il prodotto finale deve offrire e identifica i vincoli tecnici e operativi entro cui il sistema deve operare. Un'analisi accurata è essenziale per i progettisti e gli sviluppatori al fine di comprendere a pieno le esigenze del proponente e individuare le soluzioni tecnologiche più appropriate. Un documento di analisi completo e preciso permette di limitare i rischi di progetto, evitare errori di interpretazione e prevenire ritardi che si tradurrebbero inevitabilmente in costi aggiuntivi.
  Per garantire una rappresentazione formale e comprensibile a tutti gli stakeholder del progetto, il documento adotta la notazione UML#sub[G] per la descrizione dei casi d'uso, ognuno dei quali è descritto seguendo una struttura logica rigorosa che comprende:

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

  == Scopo del prodotto
  l prodotto è un'applicazione software per la verifica automatizzata della conformità alla norma EN 18031, uno standard tecnico europeo per la sicurezza informatica dei dispositivi radio (Wi-Fi, LTE, BT, IoT wireless). L'obiettivo è guidare l'utente nella valutazione dei requisiti di cybersecurity attraverso l'esecuzione automatizzata di decision tree, velocizzando e standardizzando il processo di verifica della conformità e generando la documentazione necessaria. Il sistema sostituisce il processo manuale che è dispendioso in termini di tempo, soggetto a errori umani e difficile da aggiornare.
  
  == Glossario
  Il presente documento fa riferimento a un Glossario esterno (versione 1.0.0) che raccoglie tutti i termini tecnici, gli acronimi e i concetti specifici utilizzati nell'ambito del progetto. I termini definiti nel Glossario sono evidenziati in corsivo e contrassegnati dal simbolo #sub[G] quando compaiono nei documenti di progetto. Il Glossario è disponibile come documento separato allegato alla documentazione interna di progetto.??

  == Miglioramenti del documento
  Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da:

   - Team di sviluppo: in caso di ambiguità o necessità di chiarimenti tecnici
   - Azienda proponente: per integrazioni o modifiche ai requisiti

   Le modifiche sostanziali ai requisiti comportano l'incremento della versione principale (es. da 1.0 a 2.0), mentre correzioni minori o chiarimenti incrementano la versione secondaria (es. da 1.0 a 1.1). Dunque questo è un documento  Pertanto non può essere garantita la stabilità dei requisiti fino al completamento della fase di analisi.??

  == Riferimenti
  
  === Riferimenti normativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_progetto.pdf")[Norme di Progetto v.0.0.1];\ 
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Regolamento del progetto didattico]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \
  ]
  === Riferimenti informativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf")[Glossario v.0.0.1]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf")[Diagrammi dei casi d'uso]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Analisi dei requisiti ];\
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/")[Verbali interni]; \
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/")[Verbali esterni]; \
  ]
]


#insertArabicNumberedPagesSenzaData(PageTitle: "Descrizione generale", documentType: doc)[
  = Descrizione generale

  == Obiettivi del prodotto

  L'obiettivo del prodotto è sviluppare un sistema software che automatizzi e semplifichi il processo di verifica della conformità dei dispositivi radio allo standard tecnico EN 18031, norma armonizzata per la RED (Direttiva sulle apparecchiature radio 2014/53/UE). Il sistema dovrà essere in grado di guidare gli utenti attraverso la valutazione dei requisiti normativi tramite decision tree interattivi, riducendo significativamente i tempi di verifica e minimizzando gli errori umani.
  La soluzione permetterà di importare documenti tecnici relativi ai dispositivi da analizzare, elaborare automaticamente i decision tree associati ai requisiti di sicurezza informatica della norma EN 18031, e generare output chiari sulla conformità (Not Applicable, Pass o Fail). Una dashboard interattiva consentirà agli utenti di visualizzare lo stato delle valutazioni, modificare i decision tree e gestire la documentazione in modo efficiente.

  == Funzioni del prodotto

  L'applicazione sviluppata permetterà agli utenti di verificare la conformità dei dispositivi radio alla normativa EN 18031 attraverso un processo guidato e automatizzato. Il sistema si baserà sull'elaborazione di decision tree strutturati gerarchicamente, centralizzando le informazioni tecniche e semplificando la generazione della documentazione di conformità.

  Le funzionalità implementate nell'applicazione includono:

 #pad(left: 1em)[
  - *Importazione di documenti tecnici*: il sistema consente di caricare documenti in formati standard (CSV, XML, JSON) contenenti le informazioni preliminari sui componenti di rete del dispositivo da analizzare, quali interfacce, funzionalità e configurazioni di rete.

  - *Caricamento e gestione dei decision tree*: possibilità di importare file strutturati (XML, JSON) che descrivono i percorsi decisionali e i nodi di valutazione per ciascun requisito della norma EN 18031.

  - *Esecuzione guidata dei decision tree*: elaborazione automatica dei decision tree rispettando le dipendenze gerarchiche tra requisiti, con presentazione interattiva delle domande all'utente e valutazione del percorso in base alle risposte fornite.

  - *Valutazione della conformità*: determinazione automatica per ogni requisito di uno dei tre possibili esiti (Not Applicable, Pass o Fail), con tracciamento completo del processo decisionale seguito.

  - *Dashboard di visualizzazione*: interfaccia grafica che mostra lo stato aggregato di tutti i requisiti analizzati, permettendo una visione d'insieme immediata della conformità del dispositivo.

  - *Navigazione dei decision tree*: visualizzazione grafica della struttura dei decision tree con evidenziazione del percorso seguito durante la valutazione, facilitando la comprensione delle decisioni prese.

  - *Editor grafico dei decision tree*: strumento integrato per la modifica visuale dei decision tree, consentendo l'adattamento della struttura di valutazione e il successivo salvataggio in formati strutturati.

  - *Gestione della documentazione*: possibilità di modificare e aggiornare i documenti tecnici importati direttamente all'interno dell'applicazione.

  - *Esportazione dei risultati* (opzionale): generazione di report in diversi formati (PDF, CSV, JSON, XML) contenenti i risultati delle valutazioni e le giustificazioni associate.

  - *Annotazioni e giustificazioni* (opzionale): aggiunta di note esplicative per documentare le motivazioni dei risultati ottenuti, migliorando la tracciabilità delle decisioni.
 ]

  == Caratteristiche degli utenti

  Tecnici di conformità utilizzeranno l'applicazione per verificare la conformità dei dispositivi radio alla norma EN 18031, guidati attraverso decision tree interattivi. Potranno importare documenti tecnici, rispondere a domande strutturate e visualizzare i risultati (Pass/Fail/Not Applicable) tramite dashboard, eliminando la consultazione manuale dello standard.
  Responsabili qualità e compliance manager utilizzeranno il sistema per monitorare lo stato complessivo della conformità, accedere ai risultati delle verifiche ed esportare report per audit e certificazioni, garantendo tracciabilità completa delle decisioni prese.
  Nuovi membri del team troveranno nell'applicazione uno strumento di supporto per comprendere la struttura della norma EN 18031, utilizzando l'editor grafico dei decision tree per familiarizzare con i requisiti e accelerare il processo di formazione sulla normativa.
  
  == Piattaforma di esecuzione

  Il prodotto si presenterà sotto forma di applicazione desktop o web-based, con la scelta della modalità di deployment da definirsi in fase di progettazione in accordo con l'azienda committente.

  Nel caso di applicazione web-based, il sistema sarà consultabile dai principali browser moderni, in particolare sarà garantita la sua esecuzione nelle ultime versioni di Google Chrome, Mozilla Firefox, Microsoft Edge e Safari. L'applicazione web non richiederà installazioni locali e sarà accessibile da qualsiasi sistema operativo dotato di browser compatibile.

  Nel caso di applicazione desktop, il software sarà installabile su sistemi operativi Windows 10/11, macOS 10.15 o versioni successive, e distribuzioni Linux mainstream, garantendo il funzionamento offline completo dopo l'installazione.
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Casi d'uso", documentType: doc)[

  = Casi d'uso

  == Scopo

  Lo scopo di questa sezione è descrivere in maniera dettagliata i casi d'uso individuati dal gruppo, in riferimento alle funzionalità del sistema di verifica della conformità allo standard EN 18031.

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
    1. L'utente accede alla funzionalità di importazione documenti
    2. Il sistema mostra l'interfaccia di selezione dei file
    3. L'utente seleziona uno o più file nei formati supportati (CSV, XML, JSON)
    4. Il sistema valida i file selezionati verificando formato e struttura
    5. Il sistema carica i documenti e li memorizza
    6. Il sistema mostra un messaggio di conferma dell'avvenuta importazione
    7. Il sistema visualizza un riepilogo delle informazioni importate
]
- *Scenari Alternativi*:
  - *3a*: L'utente annulla la selezione
    - 3a.1: Il sistema torna alla schermata principale senza modifiche
  - *4a*: Il formato del file non è supportato
    - 4a.1: Il sistema mostra un messaggio di errore indicando i formati validi
    - 4a.2: Il sistema torna al passo 2
  - *4b*: La struttura del file non è valida
    - 4b.1: Il sistema mostra un messaggio di errore con i dettagli del problema
    - 4b.2: Il sistema torna al passo 2


]