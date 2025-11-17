#import "/src/config.typ": *
#import "@preview/timeliney:0.4.0"
#import template_dir + "/frontPage.typ": frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set heading(numbering: "1.1)")
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}

#let tabellaRischi( codice:str, 
                    nome:str,
                    tipo:str,
                    descr:content,
                    prevenzione:str,
                    mitigazione:content,
                    frequenza:str,
                    pericolo:str
                    )={
  box(width: 100%,height: auto, stroke: black)[
  #block(  fill: luma(100%),
  inset: 8pt,width: 100%)[
  // #lorem(30)
  #block(stroke:1pt+black,width:100%,inset: 8pt,outset:8pt, fill: luma(230))[
  #align(center)[*#codice - #nome * ]
  ]
  #show table.cell: it =>{
if it.x == 0 {

    strong(it)
  } else {
    it
  } 
  }
  #table(
    columns: (auto,1fr),
    fill: (_, y) => if calc.odd(y) { rgb("#bbbdbe") },
  )[Tipo di rischio][#tipo][Descrizione][#descr][Prevenzione][#prevenzione][Mitigazione][#mitigazione][Frequenza/Probabilità \ di avvenimento][#frequenza][Pericolosità][#pericolo]
  ]
  ]
}

#let doc="Piano di progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.1",
    autori: ("Davide Lorenzon",),
    revisori:("-",),
    validatori: ("-",),
    uso: "Esterno",
    destinatari: ("Prof. Tullio Vardanega","Prof. Riccardo Cardin", "BlueWind srl"),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1],[2025-11-12],[Stesura iniziale],[Davide Lorenzon],[-],[-]),
  
)
#registroModifiche(modifiche)
// #utilityTable(modifiche,header:header,columns:(auto,auto,2fr,1fr,1fr,1.1fr))


]

#insertRomanNumberedPagesSenzaData(PageTitle: "Indice", documentType: doc)[
  #outline(title: "Indice")
]
#context counter(page).update(1)
#insertArabicNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
= Introduzione
== Scopo del documento
Nell'ambito dei progetti di sviluppo software, 
al fine di garantire obiettivi di efficacia ed efficienza,
è necessario un documento che consenta alle parti interessate di allineare il 
proprio lavoro, coordinarsi e valutare lo stato del progetto.

Definisce l'ambito del progetto, specifica quali sono le attività 
necessarie allo sviluppo del progetto.

Fornisce informazioni precise sulle ore dedciate a ciascuna attività e i costi derivanti.

In particolare vengono analizzati i seguenti temi:
- Analisi dei rischi
- Pianificazione delle attività
- Stima dei costi e delle risorse necessarie allo sviluppo del progetto. 






== Scopo del prodotto
Gennaio 2025, lo standard tecnico EN 18031 è stato inserito nella Gazzetta Ufficiale
dell’Unione Europea. \
Questo comporta l'entrata in vigore di nuovi standard per un’ampia gamma di prodotti che utilizzano Wi-Fi,
LTE, BT o dispositivi IoT wireless. \
Obbligatori dal 1 agosto 2025.
  L'obiettivo del prodotto è sviluppare un sistema software che automatizzi e semplifichi il processo di verifica della conformità dei dispositivi radio allo standard tecnico EN 18031, norma armonizzata per la RED (Direttiva sulle apparecchiature radio 2014/53/UE). Il sistema dovrà essere in grado di guidare gli utenti attraverso la valutazione dei requisiti normativi tramite decision tree interattivi, riducendo significativamente i tempi di verifica e minimizzando gli errori umani.
  La soluzione permetterà di importare documenti tecnici relativi ai dispositivi da analizzare, elaborare automaticamente i decision tree associati ai requisiti di sicurezza informatica della norma EN 18031, e generare output chiari sulla conformità (Not Applicable, Pass o Fail). Una dashboard interattiva consentirà agli utenti di visualizzare lo stato delle valutazioni, modificare i decision tree e gestire la documentazione in modo efficiente.

  == Miglioramenti del documento
  Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da:

   - Team di sviluppo: in caso di ambiguità o necessità di chiarimenti tecnici
   - Azienda proponente: per integrazioni o modifiche ai requisiti

   Le modifiche sostanziali ai requisiti comportano l'incremento della versione principale (es. da 1.0 a 2.0), mentre correzioni minori o chiarimenti incrementano la versione secondaria (es. da 1.0 a 1.1). Dunque questo è un documento  Pertanto non può essere garantita la stabilità dei requisiti fino al completamento della fase di analisi.??

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[

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


#insertArabicNumberedPagesSenzaData(PageTitle: "Organizzazione del progetto", documentType: doc)[
= Organizzazione del progetto

== Ruoli

#list(
  [*Responsabile*:
  - Coordina l’elaborazione di piani e scadenze
  - Approva il rilascio di prodotti parziali o finali
  - Comunica con il committente
  - Garantisce che le risorse disponibili siano usate con efficienza
  - Presenza richiesta durante tutto l'arco del progetto
  ],
  
  [*Amministratore*: 
  - Assicura l’efficienza di procedure, strumenti e tecnologie a supporto del way of working
  - Prensenza richiesta durante tutto l'arco del progetto
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
  - Figura essenziale nella fase di implementazione e successiva
  ]
  )



]


#insertArabicNumberedPagesSenzaData(PageTitle: "Analisi dei rischi", documentType: doc)[
  = Analisi dei rischi
    Nella seguente sezione vengono esplotrati i potenziali rischi che potrebbero verificarsi durante la durata del progetto.
    Al fine di prevenire o mitigare i danni derivanti dai rischi è necessaria un'analisi adeguata.

    Il processo di analisi dei rischi consite dei seguenti passaggi: 
    - Identificazione dei rischi, è la prima fase della gestione dei rischi
    - Ananlisi dei rischi
    - Valutazione dei rischi
    - Gestione dei rischi
    - Monitoraggio e revisione dei rischi

  == Identificazione dei rischi 
    === Tipi di rischi
    Si è optato per catalogare i possibili rishi, in base alla loro natura e al loro impatto, nelle seguenti categorie non mutualmente esclusive:
    - Rischi di progetto \
      Tali rischi intaccano la tabella di marcia o le risorse disponibili per il progetto.
    - Rischi di prodotto \
      Tali rischi intaccano la qualità o le capacità del prodotto.

    - #strike()[Rischi legati al business] #footnote()[Data la natura del progetto, attualmente non si ritiene possibile l'insorgere di queste tipologie di rischi ] \
    Tali rischi intaccano l'organizzazione che ha sviluppato o commissionato il software.

    === Registro dei rischi

    ==== Rischi tecnologici
    #let contatoreR= counter("rischi tec")
    #contatoreR.update(1)
    #let prefisso="R.T."

    #tabellaRischi(
      codice:getCode(prefisso:prefisso,contatore:contatoreR),
      nome:"Inesperienza ",
      tipo:"Rischio di progetto + Rischio di prodotto",
      descr: [Mancanza di esperienza da parte dei membri del gruppo in progetti diquesta portata, con architettura non monolitica],
      prevenzione: lorem(20),
      mitigazione: [È necessario prevedere la possibilità che parte
dell’impegno orario sarà dedicato alla formazione
personale per l’uso di tale componente: è bene
dunque valutare di spostare attività eventualmente
di minore importanza al primo periodo successivo
utile qualora altri componenti del gruppo non
possano fornire supporto immediato. È necessario
valutare anche la disponibilità di BlueWind al supporto.
],
      frequenza: "Alta",
      pericolo: "Elevata"
    )



    ==== Rischi personali
    #let contatoreR= counter("rischi pers")
    #let prefisso="R.P."

      // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),



    ==== Rischi organizzativi
    #let contatoreR= counter("rischi org")
    #let prefisso="R.O."

      // ([#getCode(prefisso:prefisso,contatore:contatoreR)],[],[]),


  // == Analisi dei rischi 
  //   Lista dei rischi ordinati per priorità, espressa in probabilità che accada e impatto sul progetto. 
  // == Prevenzione e gestione dei rischi 
  //   Strategie atte ad evitare, minimizzare o contenere i rischi
  == Monitoraggio dei rischi 
    Modalità di monitoraggio e aggiornamento dei rischi, per garantire che l'analisi dei rischi sia efficcacie è necessario un aggiornamento periodico, ovvero un ritorno alla fase di analisi.

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Suddivisione del lavoro", documentType: doc)[
  = Scomposizione del lavoro

  Scomposizione delle attività di progetto e identificazione degli input e degli output di ogni attività.
  Eventualmente separandole per "scope", processi primari, di supporto, organizzativi.
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Piano di avanzamento del progetto", documentType: doc)[
  = Piano di avanzamento del progetto




]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
  = Metodi di retrospettiva


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metodi di retrospettiva", documentType: doc)[
= Analisi dei periodi di avanzamento

  Per ogni periodo 
  - Preventivo
  - Consuntivo
]
