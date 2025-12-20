#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche
#import glossario: dict
#set text(size: 13pt)
#set par(justify: true)


#set text(lang: "it")
#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]
#show link: body => {
  set text(fill: blue)
  underline()[#body]
}


// 
//Info del documento 
// 
#let doc = "Piano di qualifica"

#let currentVersion=(
  major:0,
  minor:1,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>


#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: versionNumber,
    autori: ("Felician Mario Necsulescu",),
    verificatori: ("",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = ( 
    ([0.0.1], [2025-12-15], [Felician Mario Necsulescu ], [], [Creazione del documento e stesura iniziale.]),    
    ([0.1.0], [2025-12-18], [Felician Mario Necsulescu], [], [Completamento sezione Introduzione @introduzione, Qualità del processo @processo, Qualità del prodotto @prodotto.]),    
  )
  #registroModifiche(modifiche)
  // #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")

]#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle tabelle", documentType: doc)[
#outline(
  title: [Lista delle tabelle],
  target: figure.where(kind: table),
)

]
#insertRomanNumberedPagesSenzaData(PageTitle: "Lista delle immagini", documentType: doc)[
#outline(
  title: [Lista delle immagini],
  target: figure.where(kind: image),
)
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione <introduzione>
  == Scopo del documento
  Questo Piano di Qualifica definisce in modo chiaro come la qualità del software e dei processi correlati sarà monitorata, valutata e gestita lungo tutto il ciclo di vita del progetto. L’obiettivo principale non è solo verificare il rispetto dei requisiti, ma fornire un quadro operativo che permetta al team di prendere decisioni informate e migliorare continuamente le modalità di sviluppo.
  Il documento si concentra su tre aspetti fondamentali, integrati tra loro:#pad(left: 1em)[

  - Orientamento agli obiettivi: chiarifica quali standard qualitativi devono essere raggiunti e cosa significa un software affidabile e completo;

  - Misurazione e controllo: introduce metriche concrete e strumenti di valutazione per osservare l’andamento dei processi e del prodotto;

  - Apprendimento e miglioramento: utilizza i dati raccolti per identificare criticità, ottimizzare i processi e rafforzare la qualità complessiva in maniera progressiva.
  ]

  Il Piano di Qualifica costituisce uno strumento operativo e dinamico, destinato a essere aggiornato e adattato nel tempo per riflettere le esigenze emergenti del progetto e garantire un monitoraggio efficace dei processi e del prodotto, mantenendo elevati standard qualitativi lungo tutto il ciclo di sviluppo.


  == Glossario
  Per garantire precisione terminologica senza appesantire la lettura, in questo documento i termini tecnici presenti nel Glossario sono segnalati con un pedice “G”, ad esempio: #pad(left: 1em)[

    termine#sub("G"): indica che il termine è definito nel Glossario e può essere consultato per chiarimenti.

  ]

  Questo metodo consente di mantenere il testo chiaro e tecnicamente corretto, permettendo al lettore di riferirsi al Glossario solo quando necessario, senza interrompere il flusso della lettura.

  == Riferimenti

  === Riferimenti normativi
  #pad(left: 1em)[
    - #inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/blob/main/output/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v0.8.0.pdf")[Norme di Progetto v.1.0.0];\ 
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \
  ]

  === Riferimenti informativi
  #pad(left: 1em)[
     - #inserisciLink(url:"https://github.com/GroupRubberDuck/Documentazione/blob/main/output/RTB/DocumentazioneInterna/Glossario.pdf")[Glossario v.1.0.0]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[ISO/IEC 12207 - 1995]; \
    - #inserisciLink(url:"https://it.wikipedia.org/wiki/ISO/IEC_9126")[ISO/IEC 9126]; \
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T08.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Qualità di processo];\
   
    - #inserisciLink(url:"https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T0.pdf")[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Qualità di prodotto];\

  
  ]
  
]#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità di processo", documentType: doc)[
  = Qualità di processo <processo>

  La qualità di processo rappresenta un elemento essenziale per garantire che lo sviluppo del progetto software avvenga in modo controllato, coerente e conforme agli obiettivi di qualità stabiliti. Essa assicura che i processi adottati siano definiti, ripetibili e verificabili, riducendo il rischio di errori e migliorando l’affidabilità dei risultati prodotti.
  Al fine di garantire la qualità di processo, il progetto fa riferimento a modelli e standard riconosciuti, in particolare alla norma ISO/IEC 12207, che fornisce un quadro di riferimento per l’organizzazione dei processi lungo il ciclo di vita del software, distinguendo tre tipologie di processi: 
    #pad(left: 1em)[ 
    - *processi primari*;

    - *processi di supporto*;

    - *processi organizzativi*.
  ]
 Il controllo dell’efficacia dei processi è supportato dall’adozione di metriche di processo, utilizzate per monitorare l’andamento delle attività e l’efficienza delle risorse impiegate.

  == Processi primari
  I processi primari riguardano le attività di sviluppo del software, come requisiti, progettazione, implementazione, integrazione e manutenzione. Per valutarne andamento ed efficacia, si utilizzano metriche di processo che permettono di monitorare tempi, costi e progressi, evidenziando eventuali scostamenti rispetto agli obiettivi.

 === Fornitura

#tabellaMetriche((
  (codice: "MPC-01",
  nome: "Planned Value (PV)", 
  accettabile: ">=0", 
  preferibile: "<=BAC"),

  (codice: "MPC-02",
  nome: "Earned Value (EV)", 
  accettabile: ">=PV*0.75", 
  preferibile: ">=PV" ),

  (codice: "MPC-03",
  nome: "Actual Cost (AC)", 
  accettabile: "0<= AC <= 1.2*EV, ", 
  preferibile: "<= EV"),

  (codice: "MPC-04",
  nome: "Schedule Performance Index (SPI = EV / PV)",
  accettabile: ">= 0.9", 
  preferibile: ">= 1.0"),

  (codice: "MPC-05",
  nome: "Cost Performance Index (CPI = EV / AC)", 
  accettabile: ">= 0.9", 
  preferibile: ">= 1.0"),

  (codice: "MPC-06",
  nome: "Estimate at Completion (EAC)", 
   accettabile: "<= 1.1*BAC", 
   preferibile: "<= BAC"),

  (codice: "MPC-07",
  nome: "To Complete Performance Index (TCPI)", 
  accettabile: "~ 1.0", 
  preferibile: "<= 1.0"),

  (codice: "MPC-08",
  nome: "Estimate to Complete (ETC)", 
  accettabile: "<= (BAC-AC)*1.1", 
  preferibile: "<= BAC-AC"),
),[Metriche processo di Fornitura])

 === Sviluppo

#tabellaMetriche((
  (codice: "MPC-09",
    nome: "Requirements Stability Index (RSI)",
    accettabile: ">= 0.7",
    preferibile: "1.0"
  ),
  (codice: "MPC-10",
    nome: "Requirements Coverage",
    accettabile: ">= 90%",
    preferibile: "100%"
  ),
),[Metriche processo di Sviluppo])



  == Processi di supporto
 Questi includono attività che garantiscono controllo, tracciabilità e affidabilità del processo stesso, come la verifica, la validazione, la gestione della configurazione, la documentazione tecnica e l’assicurazione qualità. Questi processi consentono di monitorare e ridurre gli scostamenti rispetto agli standard pianificati. Le metriche associate ai processi di supporto sono definite per consentire una valutazione oggettiva della conformità e del controllo delle attività di supporto rispetto ai processi e alle procedure stabilite.
  
  === Documentazione
  #tabellaMetriche((
  (codice: "MPC-11",
    nome: "Indice di Gulpease",
    accettabile: ">= 60",
    preferibile: ">= 70"
  ),
  (codice: "MPC-12",
    nome: "Correttezza ortografica",
    accettabile: "<= 0.01",
    preferibile: "0"
  ),
  ),[Metriche processo di Documentazione])

  === Verifica 

  #tabellaMetriche((
  (codice: "MPC-13",
    nome: "Test Success Rate",
    accettabile: ">= 90%",
    preferibile: "100%"
  ),
  (codice: "MPC-14",
    nome: "Code Coverage",
    accettabile: ">= 80%",
    preferibile: "100%"
  ),
  ),[Metriche processo di Verifica])


  == Processi organizzativi
  Riguardano il miglioramento continuo del processo, la definizione degli standard interni, la gestione della qualità complessiva e lo sviluppo delle competenze del personale. Questi processi assicurano la sostenibilità e la maturità del modello di sviluppo nel tempo. Le metriche associate ai processi organizzativi sono definite per consentire una valutazione oggettiva della conformità e dell’efficacia dei processi di gestione e governance interna.


  === Gestione dei processi
  #tabellaMetriche((
    (codice: "MPC-15",
    nome: "Process Lead Time",
    accettabile: "~ time planned",
    preferibile: "<= time planned"
    ),
    (codice: "MPC-16",
     nome: "Task Completion on Time",
     accettabile: ">= 80%",
     preferibile: "100%"
    ),
 ),[Metriche processo di Gestione dei Processi ])

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Qualità di prodotto", documentType: doc)[

= Qualità di prodotto <prodotto>
 
  La qualità del prodotto software rappresenta la capacità del sistema di soddisfare in maniera oggettiva i requisiti funzionali e non funzionali, gli standard tecnici e le aspettative degli stakeholder. Essa costituisce la misura della conformità del prodotto agli obiettivi prefissati e della sua idoneità all’uso previsto, risultando direttamente dalla corretta applicazione dei processi di sviluppo e delle attività di verifica e validazione.
  Un prodotto software di elevata qualità si distingue per: adeguatezza funzionale, affidabilità, usabilità, efficienza delle prestazioni, manutenibilità.
  

== Funzionalità
Valuta la capacità del software di fornire correttamente le funzionalità richieste dai requisiti, assicurando completezza e coerenza rispetto alle specifiche definite.

#tabellaMetriche((
  (codice: "MPD-01",
    nome: "Requisiti obbligatori soddisfatti",
    accettabile: "100%",
    preferibile: "100%"
  ),
  (codice: "MPD-02",
    nome: "Requisiti opzionali soddisfatti",
    accettabile: ">= 0",
    preferibile: ">= 75%"
  ),
  ( codice: "MPD-03",
    nome: "Requisiti desiderabili soddisfatti",
    accettabile: ">= 50%",
    preferibile: "100%"
  ),
),[Metriche funzionalità del prodotto])

== Affidabilità
Misura la capacità del software di operare senza guasti in condizioni previste, garantendo comportamenti consistenti e riducendo al minimo malfunzionamenti.

#tabellaMetriche((
  (codice: "MPD-04",
    nome: "Failure Density",
    accettabile: "<= 0.5",
    preferibile: "<= 0.2"
  ),
  (codice: "MPD-05",
    nome: "Statement Coverage",
    accettabile: ">= 80%",
    preferibile: ">= 95%"
  ),
  (codice: "MPD-06",
    nome: "Branch Coverage",
    accettabile: ">= 70%",
    preferibile: ">= 90%"
  ),
),[Metriche affidabilità del prodotto])

== Usabilità
Rileva quanto il software sia intuitivo e facile da utilizzare, considerando la semplicità delle interazioni, la facilità di apprendimento e la correttezza delle operazioni da parte degli utenti.

#tabellaMetriche((
  (codice: "MPD-07",
    nome: "User Error Rate",
    accettabile: "<= 3% degli utenti per task",
    preferibile: "<= 1% degli utenti per task"
  ),
  (codice: "MPD-08",
    nome: "Time to Complete Task",
    accettabile: "<= 60 sec",
    preferibile: "<= 30 sec"
  ),
),[Metriche usabilità del prodotto])

== Efficienza 
Indica l’ottimizzazione delle risorse e la rapidità di risposta del software alle richieste, valutando tempi di esecuzione, throughput e utilizzo delle risorse disponibili.

#tabellaMetriche((
  (codice: "MPD-09",
    nome: "Response Time",
    accettabile: "<= 2 sec",
    preferibile: "<= 1 sec"
  ),
  (codice: "MPD-10",
    nome: "CPU Utilization",
    accettabile: "<= 75%",
    preferibile: "<= 60%"
  ),
  (codice: "MPD-11",
    nome: "Memory Utilization",
    accettabile: "<= 80%",
    preferibile: "<= 65%"
  ),
),[Metriche efficienza del prodotto])

== Manutenibilità
Misura quanto facilmente il software può essere modificato o esteso senza introdurre errori, tenendo conto della complessità del codice, della modularità e della facilità di intervento sugli artefatti.

#tabellaMetriche((
  (codice: "MPD-12",
    nome: "Cyclomatic Complexity",
    accettabile: "<= 10",
    preferibile: "<= 8"
  ),
  (codice: "MPD-13",
    nome: "Modularity Index",
    accettabile: ">= 0.7",
    preferibile: ">= 0.85"
  ),
  (codice: "MPD-14",
    nome: "Coefficient of Coupling",
    accettabile: "<= 0.4",
    preferibile: "<= 0.2"
  ),
  (codice: "MPD-15",
    nome: "Code Smells",
    accettabile: "<= 10 ",
    preferibile: "<= 5"
  ),
),[Metriche manutenibilità del prodotto])


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Strategie di testing", documentType: doc)[
= Strategie di testing





]






#insertArabicNumberedPagesSenzaData(PageTitle: "Cruscotto di valutazione", documentType: doc)[
= Cruscotto di valutazione




]