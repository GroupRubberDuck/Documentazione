#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart
#import "/src/RTB/DocumentazioneInterna/Glossario.typ" : dict
#set text(size: 13pt)
// #set par(justify: true)

#set text(lang: "it")
#set heading(numbering: "1.1)")
#set footnote.entry(indent: 0em)
#show ref: body => underline()[*#body*]
#show link: body => {set text(fill:blue); underline()[#body]}

#let doc="Norme di Progetto"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In progress",
    versione: "0.1",
    autori: ("Davide Lorenzon", "Aldo Bettega",),
    verificatori: ("",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1],[2025-11-11],[Davide Lorenzon],[-],[Stesura iniziale]),
  ([0.2],[2025-11-11],[Davide Lorenzon],[-],[Aggiunta struttura dei documenti (come stabilito da verbale 2025-11-10)]),
  ([0.3],[2025-11-11],[Ana Maria Draghici],[-],[Aggiornata strutturaRE con le modifiche alla scaletta AdR]),
  
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
  In questo documento si tiene traccia e si definisce il way of working adottato dal gruppo. \

  La modalità di stesura di questo documento è incrementale, essa procede con l'avanzamento delle attività di progetto. \
  Il documento sarà soggetto ad aggiunte, modifiche o cancellazioni. \
  Esse sono causate dall'apprendimento e dalla sperimemntazione da parte del gruppo delle "Best practices"#footnote()[#dict.at("Best practices")] comuni nell'ambito dell'ingegneria del software, in modo da poterle adattare alle necessità del team e del progetto. 
  == Scopo del prodotto
  Il prodotto è un’applicazione software per la verifica automatizzata della conformità alla norma EN18031, uno standard tecnico europeo per la sicurezza informatica dei dispositivi radio (Wi-Fi , LTE , BT , IoT wireless ). 

  L’obiettivo è guidare l’utente nella valutazione dei requisiti di cybersecurity  attraverso l’esecuzione automatizzata di decision tree , velocizzando e standardizzando il processo di verifica della conformità e generando la documentazione necessaria. 
  == Glossario
  Per garantire precisione terminologica senza compromettere la leggibilità, in questo documento viene adottato un approccio ibrido alla gestione dei riferimenti al Glossario.
  I termini tecnici possono essere presentati secondo 2 modalità:

  - *Footnote al primo utilizzo*: applicata ai concetti critici o potenzialmente ambigui, permette un accesso immediato alla definizione senza interrompere il flusso logico del testo.

  - *Marcatura tramite pedice “G” (termine #sub()[G])*: utilizzata per termini ricorrenti o già contestualizzati, indica semplicemente la presenza del termine nel Glossario.
  


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[
  = Riferimenti
== Riferimenti normativi
  - #link("https://galileodiscovery.unipd.it/discovery/fulldisplay?docid=alma9938989417806046&context=L&vid=39UPD_INST:VU1&lang=it&search_scope=catalogo_no_external&adaptor=Local%20Search%20Engine&tab=Everything&query=title,contains,Software%20Engineering,AND&query=creator,contains,Ian%20Sommerville,AND&mode=advanced")[Sofware Engineering, Ian Sommerville]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento progetto]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto Automated EN18031
Compliance Verification di BlueWind]
- #link("https://www.iso.org/standard/63712.html")[Standard ISO 12207:2017]
== Riferimenti informativi
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Primari", documentType: doc)[
  = Processi Primari
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= Processi di Supporto
== Documentazione
Il processo di documentazione ha lo scopo di registrare le informazioni prodotte da processi primari. 

Permette di tracciare più facilemente le decisioni intraprese, evitare fraintendimenti, favorire l'organizzazione del lavoro asincrono.

Le attività costituenti di questo processo sono le seguenti:
#enum(numbering: "1.1)",
  [Implementazione del processo ],
  [Progettazione e sviluppo],
  [Produzione],
  [Manutenzione],
)

=== Strumenti di supporto
#list(
  [
    *Typst*: \ Linguaggio di markup moderno per la composizione e la tipografia di documenti, pensato come alternativa più semplice e veloce a LaTeX. \
    Ha una sintassi più intuitiva e supporta automazionmi tramite template, funzioni e regole di stile riutilizzabili. \
    La caratteristica più utile è la preview istantanea del documento.
  ],
  [
    GitHub: \
    Il gruppo ha deciso di usare GitHub come strumento di condivisione del lavoro e il suo sistema di issue tracking system per l'assegnazione delle attività.
    Viene inoltre usata una GitHub action per la compilazione automatica dei documenti.
    Tutta la documentazione è reperibile nel seguente #link("https://github.com/GroupRubberDuck/Documentazione")[repository].
    #upper("è") stato predisposto un sito web, sfruttando la funzionalità GitHub pages per facilitare la consultazione della documentazione.
  ],
)

=== Identificazione dei documenti <identif>
  #upper("è") una fase di pianificazione. \
  Quasi ogni documento viene identificato dalle seguenti caratteristiche

  #enum(numbering: "a-",
  [Titolo],
  [Scopo],
  [Destinatari],
  [
    Procedure e responsabilità nell'attività di documentazione.
    #terms(separator: ": ",
      ([Input],[Quali dati servono per scriverlo]),
      ([Sviluppo],[Chi lo redige]),
      ([Verifica],[Chi lo controlla]),
      ([Modifica],[Chi può aggiornarlo]),
      ([Approvazione],[Chi lo approva]),
      ([Produzione],[Come viene prodotto]),
      ([Archiviazione e distribuzione],[Strumenti e tecniche]),
      ([Manutenzione e gestione della configurazione],[Versioni, tracciabilità]),
    )
  ],
  [Pianificazione di revisioni intermedie e finali],
  )

==== Informazioni comuni <informazioni_comuni>
Ogni documento ha una sezione iniziale costituita dai seguenti elementi.
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Pagina di copertina],[Costituito da nome e logo del gruppo, informazioni di contatto, titolo del documento. \ Generata con apposito template.]),
  ([Tabella dello stato],[Tabella riassuntiva dello stato del documento. \ Generata con apposito template.]),
  ([Registro delle modifiche],[Tabella contente le informazioni sul verisonamento e sulla tracciabilità. \ Generata con apposito template.]),
  ([Indice dei contenuti],[Indice generato automaticamente da typst]),
  ([Indice delle immagini e delle tabelle],[Questi indici non vengono inseriti in tutti i documenti, anche questi generati automaticamente.]),
)

==== Verbali
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Verbale riunione _data della riunione_ .]),
  ([Scopo],[Ha una finalità riassuntiva della riunione mettendo in evidenza l'agenda, le decisioni e le attività identificate (TODO).]),
  ([Destinatari],[Membri del gruppo, se il verbale è esterno anche la proponente, BlueWind.]),
  ([Procedure e responsabilità],[Per la redazione del documento è necessario un riassunto della riunione (ottenuto sia da appunti presi manualmente, sia dalla trascrizione da parte di tool AI). \
  La redazione è a carico del Responsabile e la verifica a carico del verificatore.
  L'approvazione è a carico del responsabile.
  I verbali sono salvati nel repository GitHub seguendo il path:_src/Fase di avanzamento/DocumentazioneEsterna o interna(in base al tipo di riunione)/VerbaliEsterni o interni/data della riuninone_Verbale-vx.y.z.typ_. \
  ]),
  ([Revisioni],[Il verbale viene revisionato e approvato quando pronto]),
  ([Struttura],[#enum( numbering: "1.1)",full: true, start:0,
    [Informazioni Comuni #ref(<informazioni_comuni>)],
    [Informazioni Generali \ 
    Data e luogo della riunione, orario di inizio e fine, partecipanti, Scriba della riunione, motivo della riunione. 
    ],
    [Ordine del giorno],
    [Riassunto della riuninione],
    [Decisioni],
    [TODO],
  )]),
)


==== Diario di Bordo
Nell’ambito del progetto di Ingegneria del Software, il Prof. Tullio Vardanega ha previsto delle attività volte ad accertare, in maniera condivisa, lo stato di progresso per ogni gruppo.
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Diario di bordo _data_.]),
  ([Scopo],[Permette ai gruppi di avere un feedback sulle attività svolte e di portare all'attenzione di tutti i dubbi sulle attività di processo]),
  ([Destinatari],[Prof. Tullio Vardanega, altri gruppi.]),
  ([Procedure e responsabilità],[
  La redazione è a carico del Responsabile e la verifica a carico del verificatore.
  L'approvazione è a carico del responsabile.
  I diari di bordo sono salvati nella sezione src/DiariDiBordo/Data Data_Diario_di_bordo.typ\
  ]),
  ([Revisioni],[Revisonato e approvato entro ]),
  ([Struttura],[#enum( numbering: "1.1)",full: true, start:1,
    [Principali traguardi raggiunti],
    [Attività da completare],
    [Difficoltà incontrate],
    [Principali dubbi],

  )]),
)

==== Pianio di Progetto
#terms(separator:": ", indent: 0em, hanging-indent: 1em, tight: false,
  ([Titolo],[Piano di Progetto]),
  ([Scopo],[Documento necessario ad attuare uno sviluppo plan-driven. \ 
  Le principali informazioni che contiene sono l'ambito del progetto, preventivo iniziale, risorse disponibili, analisi e piano di gestione dei rischi, suddivisione e scheduling del lavoro.]),
  ([Destinatari],[Interni, esterni ( BlueWind s.r.l. , professori )]),
  ([Procedure e responsabilità],[
    La redazione del documento è in carico al responsabile, ? analista per l'analisi dei rischi ?.
    La verifica è a carico del verificatore.
    L'approvazioen è a carico del responsabile.
    Il piano di progetto è salvato nel seguente path src/RTB/DocumentazioneEsterna/Piano_di_progetto-vx.y.z.typ
  ]),
  ([Revisioni],[Sono previste revisioni intermedie al termine di ogni periodo e un'approvazione finale per la RTB.]),
)

=== Progettazione dei documenti
Ogni documento identificato deve rispettare gli standard di documentazione:
formato A4, i contenuti devono essere coerenti con lo scopo del documento, definito nella #ref(<identif>),un indice dei contenuti (eccetto il diario di bordo), l'header e il footer della pagina deve contenere le seguenti informazioni:
- Sezione attuale del documento
- Nome del gruppo  
- Titolo del documento
- Pagina corrente, espresse in numeri romani per la "prefazione", in numeri arabi per il corpo del documento

In caso si usino fonti no0n autorevoli è obbligatorio verificarne la correttezza.
Esempi di fonti autorevoli: Standard ISO o di altre organizzazioni autorevoli, materiale delle lezioni

TODO:
stabilire una checklist per la verifica ed eventuali strumenti di approvazione o revisione automatica o semi automatica

=== Produzione 
  I documenti sono compilati automaticamente da una GitHub action.
  Sono visibili pressa la repository #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].  
  Per facilitare la consultazione è possibile usarel'apposito sito web: 
  #link("https://grouprubberduck.github.io/Documentazione")

  Versionamento e tracciabilità vengono realizzati attraverso il registro delle modifiche.


=== Manutenzione 


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Organizzativi", documentType: doc)[
= Processi Organizzativi
== Gestione del Processo
=== Ruoli di Progetto
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
=== Matrice Ruolo-Documento
*Legenda* :\
Azioni:
- R = Redazione.
- V = Verifica.
- A = Approvazione.
- C = Contribuente.
Ruoli:
- Responsabile = RESP.
- Amministratore = AMM.
- Analista = ANL.
- Progettista = PRG.
- Programmatore = PGRmm.
- Verificatore = VRF.

#{
  show table.cell: set text(size: 11pt)
  table(
    columns: 7,
    align: horizon,
    table.header([*Documento*],[*RESP*],[*AMM*],[*ANL*],[*PRG*],[*PRGmm*],[*VRF*]),
  [Norme di Progetto (NdP)],[R/A],[R],[-],[-],[-],[V],
  [Analisi dei Requisiti (AdR)],[A],[-],[R],[-],[-],[V],
  [Piano di Progetto (PdP)],[R/A],[-],[C (supporto rischi)],[-],[-],[V],
  [Piano di Qualifica (PdQ)],[A],[R],[-],[-],[-],[V],
  [Design Document (DD)],[A],[-],[C (per coerenza requisiti)],[R],[C],[V],
  [Manuale Utente (MU)],[A],[-],[-],[R],[C],[V],
  [Verbali interni],[R/A],[R],[-],[-],[-],[V],
  [Verbali esterni],[R/A],[R],[-],[-],[-],[V],
  [Test Report (TR)],[A],[-],[-],[C],[R],[V],
  [Documentazione tecnica interna],[A],[R (per strumenti e template)],[R],[C],[-],[V],
  )
}

]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche e standard per la Qualità", documentType: doc)[
= Metriche e standard per la Qualità
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Processo", documentType: doc)[
= Metriche di Qualità del Processo
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Metriche di Qualità del Prodotto", documentType: doc)[
= Metriche di Qualità del Prodotto
]


