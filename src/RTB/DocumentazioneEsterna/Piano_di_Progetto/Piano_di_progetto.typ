#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiTecnologici
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiPersonali
#import template_dir + "/PdP/tabellaRischi.typ": tabellaRischiOrganizzativi
#import template_dir + "/PdP/tabellaAtt.typ": tabellaAtt
#import glossario: dict
#set text(size: 13pt)
#set par(justify: true)


// #let chiavi=dict.keys().map(key=>{
//   "(?i)\\b" + key + "\\b"

// }
// )
// #let reg=regex(chiavi.join("|"))
// #show reg:name=>{
//   name+sub(strong("G"))
// }




#set text(lang: "it")
#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]
#show link: body => {
  set text(fill: blue)
  underline()[#body]
}







#let doc = "Piano di progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.1.0",
    autori: ("Davide Lorenzon",),
    verificatori: ("Aldo Bettega",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega", "Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


  #let header = ("Versione", "Data", "Descrizione", "Autore", "Revisore", "Validatore")
  #let modifiche = (
    ([0.1.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Stesura iniziale]),    
    ([0.2.0], [2025-11-12], [Davide Lorenzon], [Aldo Bettega], [Layout per la pianificazione di lungo periodo]),
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
  = Introduzione
  == Scopo del documento
 Nell'ambito dei progetti di sviluppo software,
  al fine di garantire il raggiungimento di  obiettivi di efficacia ed efficienza,
  è fondamentale predisporre un documento che consenta alle parti interessate di allineare il
  proprio lavoro, coordinarsi e monitorare lo stato di avanzamento  lo stato del progetto.

  Tale documento definisce l'ambito del progetto e specifica quali sono le attività
  necessarie per il suo sviluppo. Inoltre, fornisce informazioni dettagliate sulle ore di lavoro dedicate a ciascuna attività e sui relativi costi. 

  In particolare, il documento analizza i seguenti temi:
  #pad(left: 1em)[ 
  - Analisi dei rischi
  - Pianificazione delle attività
  - Stima dei costi e delle risorse necessarie allo sviluppo del progetto
]
  == Scopo del prodotto
  Dal gennaio 2025 lo standard tecnico EN 18031 è stato inserito nella Gazzetta Ufficiale
  dell’Unione Europea. Questo comporta l'entrata in vigore di nuovi standard per un’ampia gamma di prodotti che utilizzano Wi-Fi, LTE, BlueTooth o dispositivi IoT wireless, obbligatori dal 1 agosto 2025.\

  Lo scopo del prodotto è sviluppare un sistema software che automatizzi e semplifichi il processo di verifica della conformità dei dispositivi radio allo standard tecnico EN 18031, norma armonizzata per la RED (Direttiva sulle apparecchiature radio 2014/53/UE). 

  Il sistema dovrà essere in grado di guidare gli utenti attraverso la valutazione dei requisiti normativi tramite decision tree interattivi, riducendo significativamente i tempi di verifica e minimizzando gli errori umani.
  La soluzione permetterà di importare documenti tecnici relativi ai dispositivi da analizzare, elaborare automaticamente i decision tree associati ai requisiti di sicurezza informatica della norma EN 18031, e generare output chiari sulla conformità (Not Applicable, Pass o Fail). Una dashboard interattiva consentirà agli utenti di visualizzare lo stato delle valutazioni, modificare i decision tree e gestire la documentazione in modo efficiente.

  == Miglioramenti del documento
  Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da:

  - Team di sviluppo: in caso di ambiguità o necessità di chiarimenti tecnici
  - Azienda proponente: per integrazioni o modifiche ai requisiti

  Le modifiche sostanziali ai requisiti comportano l'incremento della versione principale (es. da 1.0.0 a 2.0.0), mentre chiarimenti incrementano la versione secondaria (es. da 1.0.0 a 1.1.0). La correzione ortografica o di parti errate relative ad una versione secondaria incrementerà la versione terziaria (es. da 1.1.0 a 1.1.1).\
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[

  == Riferimenti

  === Riferimenti normativi
  #pad(left: 1em)[
    - #inserisciLink(
        url: "https://github.com/GroupRubberDuck/Documentazione/output/RTB/DocumentazioneEsterna/Piano_di_progetto.pdf",
      )[Norme di Progetto];\
    - #inserisciLink(
        url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf",
      )[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Regolamento del progetto didattico]; \
    - #inserisciLink(
        url: "https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf",
      )[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \
  ]
  === Riferimenti informativi
  #pad(left: 1em)[
    - #inserisciLink(
        url: "https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf",
      )[Glossario]; \
    - #inserisciLink(
        url: "https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf",
      )[Diagrammi dei casi d'uso]; \
    - #inserisciLink(
        url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf",
      )[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Analisi dei requisiti ];\
    - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Verbali interni]; \
    - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Verbali esterni]; \
  ]


]


#insertArabicNumberedPagesSenzaData(PageTitle: "Organizzazione del progetto", documentType: doc)[
  = Organizzazione del progetto
// valutare se lasciarlo qui 
  == Ruoli

  #list(
    [*Responsabile*:
      - Coordina l’elaborazione di piani e scadenze
      - Approva il rilascio di prodotti parziali o finali
      - Comunica con il committente
      - Garantisce che le risorse disponibili siano usate con efficienza
      - Si occupa della redazione di documenti
      - Presenza richiesta durante tutto l'arco del progetto
    ],

    [*Amministratore*:
      - Assicura l’efficienza di procedure, strumenti e tecnologie a supporto delle norme di progetto
      - Presenza richiesta durante tutto l'arco del progetto
    ],

    [*Analista*:
      - Svolge le attività di analisi dei requisiti
      - Figura essenziale nella fase iniziale del progetto
    ],

    [*Progettista*:
      - Si occupa di progettare un'architettura che soddisfi i requisiti stabiliti dall'analista
      - Svolge le attività di design e modellazione
      - Figura essenziale nella fase di progettazione (successiva all'analisi dei requisiti)
    ],

    [*Programmatore*:
      - Svolge le attività di codifica
      - Implementa le scelte prese dal progettista
      - Figura essenziale nella fase di implementazione
    ],
    [*Verificatore*:
      - Garantisce la qualità degli elementi sviluppati
      - Svolge le attività di testing e validazione
      - Presenza richiesta durante tutto l'arco del progetto
    ],
  )



]


#insertArabicNumberedPagesSenzaData(PageTitle: "Analisi dei rischi", documentType: doc)[
  = Analisi dei rischi
#include "content/03-analisi_rischi/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Suddivisione del lavoro", documentType: doc)[

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Piano di avanzamento del progetto", documentType: doc)[
  = Piano di avanzamento del progetto

  // == Scomposizione del lavoro

  // Scomposizione delle attività di progetto e identificazione degli input e degli output di ogni attività.
  // Eventualmente separandole per "scope", processi primari, di supporto, organizzativi.
  == Pianificazione di lungo periodo
  === Requirements and Technology Baseline
  #let attivitaADR=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
      "Definizione dei casi d'uso",
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Analisi dei Requisiti")[
#tabellaAtt(titolo:"Analisi dei Requisiti",attivita:attivitaADR)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
      [Analisi e gestione \ dei rischi],
      [_Sprint 1_],
      "In corso",
      [Pianificazione di \ lungo periodo],
      [_Sprint 1_],
      "In corso",
      [Pianificazione di \ lungo periodo],
      [_Sprint 1_],
      "In corso",
      [Studio dei metodi \ di retrospettiva],
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Piano di Progetto")[
#tabellaAtt(titolo:"Piano di Progetto",attivita:attivitaPP)
]

  #let attivitaPP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Piano di Qualifica")[
#tabellaAtt(titolo:"Piano di Qualifica",attivita:attivitaPP)
]


  #let attivitaNP=(
      "Studio della struttura del documento",
      [_Sprint 1_],
      "In corso", 
      "Redazione dell'introduzione",
      [_Sprint 1_],
      "In corso",
      "Studio dei processi di di ciclo di vita primari",
      [_Sprint 1_],
      "In corso",
      "Studio dei processi di di ciclo di vita di supporto",
      [_Sprint 1_],
      "In corso",
      "Studio dei processi di di ciclo di vita organizzativi",
      [_Sprint 1_],
      "In corso",
  ) 
#figure(caption:"RTB-Norme di Progetto")[
#tabellaAtt(titolo:"Norme di Progetto",attivita:attivitaNP)
]

  #let attivitaGL=(
      "Aggiornamento del glossario",
      [_Sprint 1_],
      "In corso", 
  ) 
#figure(caption:"RTB-Glossario")[
#tabellaAtt(titolo:"Glossario",attivita:attivitaGL)
]


  #let attivitaPoC=(
      "",
      [],
      "", 
  ) 
#figure(caption:"RTB-Proof of Concept")[
#tabellaAtt(titolo:"Proof of Concept",attivita:attivitaPoC)
]



  === Product Baseline
  Allo stato attuale il gruppo non possiede informazioni sufficienti a eseguire una adeguata previsione delle attività di questa fase.

  #pagebreak()
  == Pianificazione nel breve periodo
  #include "content/04-pianificazione_breve_periodo/index.typ"
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
  = Metodi di retrospettiva
  La retrospettiva è un elemento essenziale dei modelli agile, fornisce informazioni al team per riflettere sul proprio lavoro, identificare punti di miglioramento, e pianificare i prossimi passi da intraprendere negli sprint futuri.
  Alcuni modelli di retrospettiva sono i seguenti, non sono necessariamente mutualmente esclusivi:
  #terms(separator: ": ",
  ([Eventi significativi],[Viene creata una timeline degli eventi significativi.
  Marcando rilasci importanti, successi, fallimenti e cambiamentia una project board.
  Utile a rinfrescare la memoria dei membri del team e a fornire contesto.
  ]),
  ([Start, stop, continue],[

Questa tecnica orientata all'azione si concentra su ciò che il team dovrebbe iniziare a fare, smettere di fare e continuare a fare. \ Aiuta a identificare elementi attuabili e incoraggia il team a riflettere su comportamenti e pratiche specifici.
  ]),
([Gradito, Osteggiato, Mancato, Appreso],[

In questa tecnica, il team discute ciò che è stato gradito, osteggiato, ciò che è mancato e ciò che è stato appreso durante lo sprint. Fornisce una visione completa delle esperienze del team e aiuta a identificare le aree di miglioramento e di apprendimento.]),
  ([Mad, Sad, Glad],
  [Questa tecnica si concentra sugli aspetti emotivi del lavoro. I membri del team condividono ciò che li ha fatti sentire arrabbiati, tristi e soddisfatti. Aiuta a identificare le fonti di frustrazione e di soddisfazione, fornendo spunti sulla dinamica di gruppo e sul morale.
  ]),
  ([Five Whys],[La tecnica dei Five Whys consiste nel chiedere "perché" cinque volte per risalire alla causa principale di un problema. Aiuta il team ad approfondire le questioni e a trovare soluzioni a lungo termine, anziché affrontare i sintomi superficiali.]),
  ([Sailboat],[Questa tecnica immaginativa utilizza la metafora di una barca a vela per identificare i rischi (scogli), le sfide (ancore), le forze positive (vento) e gli obiettivi (terraferma). Aiuta il team a visualizzare il proprio lavoro e a identificare i fattori che hanno influenzato i progressi.]),
  ([What, So What, Now What],[Questa tecnica prevede tre fasi: identificare cosa è accaduto, discutere l'impatto (quindi cosa) e determinare i passi successivi (adesso cosa). Mantiene il team focalizzato sulle azioni e sui miglioramenti futuri.]),
  ([Energy Levels],[Questa tecnica valuta i livelli di energia del team identificando le attività che li hanno caricati o prosciugati. Aiuta a comprendere la motivazione del team e a pianificare azioni per ricaricare il team per il prossimo sprint.]),
  ([Dot Voting
],[La votazione a punti aiuta a dare priorità alle idee di miglioramento, consentendo ai membri del team di votare per i suggerimenti ritenuti più preziosi. Fornisce una direzione chiara su cosa concentrarsi e garantisce che gli sforzi del team siano allineati alle loro priorità.]),

  )














]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
  = Analisi dei periodi di avanzamento

  Per ogni periodo
  - Preventivo
  - Consuntivo


  Cybersecurity 
]
