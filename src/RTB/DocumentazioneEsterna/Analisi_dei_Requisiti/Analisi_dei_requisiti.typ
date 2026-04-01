#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#import "../../DocumentazioneInterna/Glossario.typ" : dict
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ": use-case-label

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
  major:1,
  minor:1,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: ("Felician Necsulescu", "Ana Maria Draghici","Davide Lorenzon", "Aldo Bettega", "Filippo Guerra"),
    verificatori:("Davide Lorenzon","Aldo Bettega", "Ana Maria Draghici","Davide Testolin","Filippo GUerra"),
    uso: "Esterno",
    destinatari: ("Team di progetto, Bluwind S.r.l",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  
  ([0.1.0],[2025-11-11],[Aldo Bettega],[Davide Lorenzon],[Creazione del documento]),
  ([0.2.0],[2025-11-12],persone.FELIX,[Ana Maria Draghici],[Stesura sezione introduzione e descrizione generale]),
  ([0.3.0],[2025-11-13],persone.FELIX,[Davide Lorenzon],[Scrittura del primo caso d'uso UC1]),
  ([0.4.0],[2025-11-15],[Ana Maria Draghici],[Davide Lorenzon],[Aggiunte @sec-scopo-doc  @sec-contesto, @sec-caso_studio , e modificata introduzione/descrizione generale]),
  ([0.5.0],[2025-11-18],[Ana Maria Draghici],[Davide Lorenzon],[Modificate le sezioni riguardanti utenti e piattaforma: @sec-utenti e @sec-piattaforma in seguito all’incontro esterno con Bluewind]),
  ([0.6.0],[2025-11-28],persone.FELIX,[Davide Lorenzon],[Scrittura dei casi d'uso: UC1.1, UC2, UC2.1, UC3, UC3.1, UC4, UC5, UC6, UC7]),
  ([0.6.1],[2025-12-6],persone.FELIX,[Davide Lorenzon],[Modifica dei casi d'uso in seguito alla riunione con Bluewind]),
  ([0.7.0],[2025-12-6],persone.FELIX,[Davide Lorenzon],[Scrittura dei casi d'uso: UC8, UC9, UC10]),
  ([0.7.1],[2025-12-07],[Davide Lorenzon],[Aldo Bettega],[Aggiunto editing degli asset ai casi d'uso.]),
  ([0.8.0], [2025-12-18], [Aldo Bettega], [Davide Testolin], [Riscrittura e riordinazione di diversi UC, aggiunti altri UC]),
  ([0.9.0], [2025-12-18], [Aldo Bettega], [Davide Testolin], [Prima stesura della parte di requisiti, scritti gran parte di requisiti obbligatori e desiderabili]),
  ([0.10.0], [2026-01-08], [Aldo Bettega], persone.FELIX, [Aggiunti requisiti di sicurezza e tabella riassuntiva]),
  ([0.10.0], [2026-01-12], persone.FELIX, persone.ALDO, [Rivista organizzazione degli use cases e delle funzionalità, refactoring generale con aggiunta di use cases]),
  ([0.11.0], [2026-02-22], persone.FILIPPO, persone.ALDO, [Rivisti use case, Aggiunti nuovi use case (32/33) relativi a AUM-4]),
  ([0.11.1], [2026-02-23], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione, creazione, eliminazione dispositivo da #use-case-label(nome-etichetta: "Visualizza lista dispositivi")  a #use-case-label(nome-etichetta: "Elimina dispositivo") 
    ]),
  ([0.11.2], [2026-02-24], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla valutazione del dispositivo da #use-case-label(nome-etichetta: "Avvia valutazione dispositivo")  a #use-case-label(nome-etichetta: "Salva valutazione") ]),
  ([0.11.3], [2026-02-25], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione,creazione, modifica ed eliminazione da #use-case-label(nome-etichetta: "Aggiunta asset")  a #use-case-label(nome-etichetta: "Modifica asset") ]),
  ([0.11.4], [2026-02-26], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla esportazioni #use-case-label(nome-etichetta: "Esporta informazioni dispositivo")]),
  ([0.11.5], [2026-02-27], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione dei requisiti #use-case-label(nome-etichetta: "Visualizza dettaglio requisito")]),
  ([0.11.6], [2026-02-28], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla compilazione dei decision tree da #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decisionale") 
  a #use-case-label(nome-etichetta: "Inserisci giustificazione decision tree") ]),
  ([0.11.7], [2026-03-01], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla generazione dei report #use-case-label(nome-etichetta: "Esporta report di conformità") ]),
  ([0.11.8], [2026-03-03], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione, inserimento dei modelli da #use-case-label(nome-etichetta: "Visualizza lista modelli") a #use-case-label(nome-etichetta: "Inserisci nuovo modello")]),
  ([0.11.9], [2026-03-05], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla modifica anagrafica dei modelli #use-case-label(nome-etichetta: "Modifica anagrafica modello")]),
  ([0.11.10], [2026-03-05], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla modifica strutturale dei modelli da #use-case-label(nome-etichetta: "Modifica modello") a #use-case-label(nome-etichetta: "Scarta modifica modello")]),
  ([0.11.11], [2026-03-05], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla eliminazione dei modelli #use-case-label(nome-etichetta: "Elimina modello")]),
  ([0.11.12], [2026-03-07], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione dei requisiti in fase di modifica del modello #use-case-label(nome-etichetta: "Visualizza dettaglio requisito modello")]),
  ([0.11.13], [2026-03-08], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione dei nodi del decision tree in fase di modifica del modello #use-case-label(nome-etichetta: "Visualizza dettaglio nodo modello decision tree")]),
  ([0.11.14], [2026-03-08], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla aggiunta, modifica, eliminazione dei requisiti da #use-case-label(nome-etichetta: "Aggiungi requisito") a #use-case-label(nome-etichetta: "Errore nodo root")]),
  ([0.11.15], [2026-03-09], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione dei requisiti in fase di modifica del modello #use-case-label(nome-etichetta: "Visualizza dettaglio requisito modello")]),
  ([0.11.16], [2026-03-10], persone.DL, persone.ALDO, [Raffinati casi d'uso relativi alla visualizzazione dei requisiti in fase di modifica del modello #use-case-label(nome-etichetta: "Esporta modello")]),
  ([0.11.17], [2026-03-13], persone.DL, persone.ALDO, [
    Aggiunti diagrammi di attività, rivisti 
    #use-case-label(nome-etichetta: "avvia valutazione dispositivo"), 
    #use-case-label(nome-etichetta: "Modifica modello"),  
    aggiunto #use-case-label(nome-etichetta: "Valuta asset"),   
 
    #use-case-label(nome-etichetta: "Salva modifica MAJOR"), 
    #use-case-label(nome-etichetta: "Salva modifica MINOR")]),
  ([0.11.18], [2026-03-13], persone.FELIX,persone.DL, [Raffinati i requisiti obbligatori @funzionali-obbligatori]),
  ([0.11.19], [2026-03-14], persone.FELIX,persone.DL, [Raffinati i requisiti desiderabili @funzionali-desiderabili]),
  ([0.11.20], [2026-03-15], persone.FELIX,persone.DL, [Raffinati i requisiti opzionali @funzionali-opzionali]),
  ([0.12.20], [2026-03-20], persone.FELIX,persone.ALDO, [Scritti requisiti di vincolo e di qualità]),
  ([1.0.0], [2026-03-22], persone.DT, [Aldo Bettega, \ Davide Lorenzon], [Approvazione]),
   ([1.1.0], [2026-03-31], persone.ANA, [Filippo Guerra], [Correzioni errori segnalati per la Requirements And Technology
Baseline]),
  ([2.0.0], [2026-03-22], persone.FILIPPO, [-], [Approvazione]),

  )

#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))




]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(
    title: "Indice",
    indent: livello => {
    if livello <= 3 {
      return livello * 1em // Indentazione normale per i primi 3
    } else {
      return 3em // Dal livello 4 in poi, restano tutti allineati sotto il 3!
    }
  }
    )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Elenco delle Figure", documentType: doc)[
  #outline(title: "Elenco delle Figure",target:figure.where(kind:image))
]
#insertRomanNumberedPagesSenzaData(PageTitle: "Elenco delle Tabelle", documentType: doc)[
  #outline(title: "Elenco delle Tabelle",target:figure.where(kind:table))
]



#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
= Introduzione <sec-intro>

Il presente documento di Analisi dei Requisiti  costituisce un elemento fondamentale per lo sviluppo del progetto software "Automated EN18031 Compliance Verification", commissionato da Bluewind S.r.l., e rappresenta la base su cui poggia l’intero processo di progettazione e implementazione del sistema.

Questo documento è stato redatto con l’intento di fornire una trattazione chiara  dei requisiti e dei casi d’uso  individuati dal team di sviluppo. La raccolta di questi dati è il risultato di un’analisi approfondita del #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[capitolato d'appalto C1 - Automated EN18031 Compliance Verification (https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf) ], di discussioni interne al gruppo di lavoro e di colloqui con i referenti aziendali, in particolare Tobia Fiorese e Alessandro Zappia.

Il documento esplicita le funzionalità che il prodotto finale deve offrire e identifica i vincoli tecnici e operativi entro cui il sistema deve operare. 

I casi d’uso sono documentati secondo la notazione UML  e comprendono nome, attori principali, precondizioni, trigger, scenario principale e scenari alternativi. Queste informazioni permettono di rappresentare in modo chiaro le interazioni tra utenti e sistema, facilitando lo sviluppo, i test e la manutenzione futura.


  
==  Scopo del documento <sec-scopo-doc>

Gli obiettivi principali di questo documento sono:
#pad(left: 1em)[
- Fornire una descrizione chiara e dettagliata dei *requisiti funzionali*  *e non funzionali* del sistema;
- Presentare i *casi d’uso principali*  , con indicazione degli attori coinvolti, scenari principali e scenari alternativi;
- Consentire la *tracciabilità dei requisiti*  rispetto ai casi d’uso e alle possibili estensioni future del sistema;
- Fornire un *riferimento* per sviluppatori, tester e manutentori per comprendere le funzionalità del sistema e le condizioni operative;
- Supportare la *gestione delle modifiche e degli aggiornamenti dei requisiti* nel corso del ciclo di vita del progetto.
]

== Scopo del prodotto 
Il prodotto è un’applicazione software per la verifica automatizzata della conformità alla norma EN18031, uno standard tecnico europeo per la sicurezza informatica dei dispositivi radio (Wi-Fi , LTE , BT , IoT wireless ). 

L’obiettivo è guidare l’utente nella valutazione dei requisiti di cybersecurity  attraverso l’esecuzione strutturata dei decision tree normativi, velocizzando e standardizzando il processo di verifica della conformità e generando la documentazione necessaria. 
== Glossario // mettere link al glossario
Per garantire precisione terminologica senza compromettere la leggibilità, in questo documento viene adottato il seguente approccio alla gestione dei riferimenti al Glossario: \
I termini tecnici vengono marcati con *pedice “G” (esempio#sub("G"))* .\ 

Questo sistema consente di mantenere il documento tecnicamente rigoroso, chiaro e facilmente navigabile, favorendo la consultazione mirata del Glossario solo quando necessario.
// Da rivedere, l'uso del glossario è ancora da definire meglio, quindi questa è solo un'idea generale, non definitiva. 
 
== Miglioramenti del documento
Il presente documento è soggetto a revisioni e aggiornamenti periodici durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da: 

- *Team di sviluppo*: in caso di ambiguità o necessità di chiarimenti tecnici; 

- *Azienda proponente*: per integrazioni o modifiche ai requisiti. 

Le modifiche sostanziali ai requisiti comportano l’incremento della versione principale (es. da 1.0 a 2.0), mentre correzioni minori o chiarimenti incrementano la versione secondaria (es. da 1.0 a 1.1). 

*Nota*: fino al completamento della fase di analisi, non può essere garantita la stabilità dei requisiti. Data la natura iterativa del processo, i requisiti presentati riflettono lo stato attuale dell’analisi e potranno essere soggetti a revisione in seguito a chiarimenti o nuovi incontri con la proponente.

 == Riferimenti  
  === Riferimenti normativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v0.13.1.pdf")[Norme di Progetto v0.13.1 (https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v0.13.1.pdf)];\ 
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Regolamento del progetto didattico (https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf)]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification (https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf)]; \
    - #inserisciLink(url:"https://www.evs.ee/en/evs-en-18031-1-2024")[European Standard EN18031 (https://www.evs.ee/en/evs-en-18031-1-2024)]
  ]
  === Riferimenti informativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf")[Glossario v1.0.0 (https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf)]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf")[Diagrammi dei casi d'uso (https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf)]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Analisi dei requisiti (https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf)];\
    - #inserisciLink(url:"https://drive.google.com/file/d/1irvFvrXyRsF3ELZAuNre4y3bLHFmszvz/view?usp=sharing")[Software Engineering, Sommerville, edizione X]
    - #inserisciLink(url:"https://github.com/zealience/IoT-Cybersecurity-Compliance")[IoT-Cybersecurity-Compliance (https://github.com/zealience/IoT-Cybersecurity-Compliance)]
  
  
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
- *Tecnici di conformità* : eseguono decision tree interattivi, importano documenti tecnici, rispondono a domande strutturate e visualizzano risultati chiari (Pass/Fail/Not Applicable), riducendo i tempi e gli errori tipici del processo manuale.

- *Responsabili qualità e compliance* : monitorano lo stato complessivo delle valutazioni, accedono ai risultati aggregati e generano report per garantire tracciabilità e supervisione delle decisioni prese.

- *Nuovi membri del team* : utilizzano strumenti grafici per familiarizzare con la struttura dei requisiti e con il processo di valutazione, accelerando la formazione sul sistema.
]
Gli *utenti principali* del sistema sono i tecnici interni di conformità, mentre le altre categorie ricoprono ruoli di supporto o supervisione.
  == Piattaforma di esecuzione <sec-piattaforma>

Il sistema sarà sviluppato come applicazione software, con possibilità di scelta tra una soluzione *web-based* o *app desktop*.

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
  - *Trigger*: evento specifico o azione dell'attore che avvia l'esecuzione del caso d'uso.\
  - *Scenario principale*: si mostra passo dopo passo la sequenza di interazioni tra attori e sistema che caratterizza il flusso di esecuzione normale, mostrando come si passa dalle condizioni iniziali al risultato finale;\
  - *Scenari alternativi*: dpercorsi di esecuzione che si discostano dal flusso normale e le situazioni in cui l'esecuzione regolare viene interrotta a causa di condizioni anomale o scelte diverse dell'utente;\
  - *Estensioni*: comportamenti alternativi che possono verificarsi durante l'esecuzione del caso d'uso, tipicamente in risposta a condizioni particolari; 
  - *Inclusioni*: funzionalità che fanno parte del caso d'uso, descrivendo le operazioni che lo compongono;\
  - *Specializzazioni*: eventuali casi d'uso figli che specializzano il caso d'uso corrente, ereditandone le caratteristiche di base e aggiungendone di specifiche.
]

== Attori

L'applicazione prevede la presenza di un Attore principale:

- *Utente*: Persona che utilizza l'applicazione per effettuare  la verifica della conformità dei dispositivi radio allo standard 
EN 18031. L'utente interagisce direttamente con il sistema attraverso l'interfaccia grafica, inserisce o carica i dati del dispositivo e degli asset, compila i decision tree associati ai requisiti, visualizza i risultati nella dashboard, gestisce il salvataggio e l'esportazione della valutazione e, se necessario, modifica i decision tree e le dipendenze tra requisiti.

  #include "content/use_case/_index.typ"

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Requisiti", documentType: doc)[
  #include "content/requisiti/index.typ"

]