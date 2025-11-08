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
#show ref: body => underline()[*#body*]

#let doc="Dichiarazione di Way of Working"

#frontPageSenzaData(doc)

#insertRomanNumberedPagesSenzaData(PageTitle: "Stato del documento", documentType: doc)[
  #statusTab(
    stato: "In review",
    versione: "1.1",
    autori: ("Davide Lorenzon, Aldo Bettega",),
    revisori:("-",),
    validatori: ("-",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([1.0],[2025-11-05],[Stesura iniziale],[Davide Lorenzon],[-],[-]),
  
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
  In questo documento si tiene traccia e si definisce il way of working adottato dal gruppo. \

  Ogni documento è coerente con la versione del way of working definita fino a quel momento, attività antecedenti a una versione del way of working potrebbero non essere coerenti con la versione attuale.

  Questo way of working si applica alle attività che vanno dal #strong("23-10-2025") fino all'approvazione della successiva versione del Way of Working

== Cosa è cambiato
Qui vengono esposte le principali modifiche, aggiunte e rimozioni al documento. 
Allo stato attuale tale sezione è vuota, in quanto il documento si trova alla prima versione.


== Modalità di comunicazione
  Le comincazioni tra i membri del gruppo avvengono principalmente tramite gli strumenti previsti e descritti nelle succesive sezioni di questo documento.

  Ulteriori modalità di comunicazioni:
  - Comunicazioni in presenza
  - Riunioni tramite discord o altre piattaforme analoghe
  - Messaggistica istantanea (WhatsApp)


== Modalità di riunione
Il gruppo si impegna a riunirsi almeno una volta per ogni periodo di avanzamento.
Gli incontri hanno funzione di allineamento, pianificazione, 
decision making e retrospective.


  == Governance e decisioni
  // TODO stabilire le maggioranze necessarie a prendere una decisione e come affrontare i disaccordi



  == Area per cui è stato stabilito un way of working:

  Attualmente il gruppo si è dato delle regole sulle attività relative ai seguenti ambiti:
  - *Area documentale*, quale documentazione produrre, come e chi la produce.
  - *Area ddelle attività primarie*, suddivisione dei ruoli.
  - *Regolamento delle riunioni*, come si svolgono le riunioni.
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Ambito documentale", documentType: doc)[
  = Attività documentale
  == Ruoli:
  Dall'analisi svolta dal gruppo basandosi sulla propria esperienza corrente e dall'osservazione di alcune best practices, sono stati delineati i ruoli necessari allo sviluppo adeguato della documentazione.

  - *Autore* #list(
    [Si occupa di scrivere la prima verisone del documento.]
    )
  - *Revisore* #list(
    [Raffina il lavoro svolto dall'autore.],
    [Applica le opportune correzioni sul contenuto#footnote()[L'efficacia del documento, la capacità di soddisfare le finalità del documento], sulla forma #footnote()[La correzione di errori grammaticali e di sintassi] e sul layout #footnote()[Il rispetto delle convenzioni stabilite per la forma dei documenti]]
    )
  - *Validatore* #list(
    [Ruolo di guardia.],
    [Controlla la qualità del lavoro svolto.],
    [Approva il documento o lo rimanda in revisione con una lista di correzioni]
    )
    === Obblighi di controllo qualità
    // TODO 
    // 
    // stilare gli obblighi di controllo qualità per i documenti
    // Esempio:
    // Level 1 (Author):
    // - Self-review checklist completion
    // - Peer preview requirements
    // - Formatting compliance verification

    // Level 2 (Reviewer):
    // - Technical accuracy validation
    // - Structural coherence assessment
    // - Compliance with objectives

    // Level 3 (Validator):
    // - Stakeholder perspective evaluation
    // - Release readiness assessment
    // - Overall quality sign-off
    === Statistiche di controllo qualità
      // TODO

      //valutare lil tracciamento dei risultati di controllo qualità

    == Rotazione e assegnazione dei ruoli
    Sono previsti 3 meccanismi di rotazione dei ruoli, ognuno di essi risponde a una specifica esigenza che il gruppo si è trovato ad affrontare durante lo svolgimento delle attività.
    - Documenti semplici
    - Documenti complessi
    - Situazioni di emergenza

    Di seguito essi vengono descritti nel dettaglio.
    === Documenti semplici <simpleDoc>
    Con il termine documento semplice si intendono documenti di limitata lunghezza e bassa complessità (ad esempio i verbali).
    Regole:#list(
    [Ogni ruolo ha cardinalità 1],
    [Vengono definite delle code per ciascun ruolo],
    [Ogni coda contiene 2 membri distinti del gruppo (nessuno può stare in 2 code)],
    [La persona che costituisce la testa della coda viene assegnatata al ruolo associato alla coda],
    [Una volta completato il ciclo di vita del documento, i membri del gruppo vengono inseriti alla fine della coda del ruolo successivo]
  )
  Di seguito si riporta un esempio di rotazione:
  Siano A, B, C, D, E, F i membri del gruppo.

  #utilityTable(header:("Documento","Autore","Revisore","Validatore"),columns:(1fr,1fr,1fr,1fr),(
    ("Documento 1","A","B","C"),
    ("Documento 2","D","E","F"),
    ("Documento 3","B","C","D")
  ))
Tale criterio garantisce che tutti i membri del gruppo attraversino tutti i ruoli e che la tupla \(Autore, Revisore, Validatore\) non rimanga uguale nel tempo (Non è sempre A,B,C o D,E,F);
    
=== Documenti complessi <complexDoc>
Con documento complesso si intendono documneti molto corposi dal punto di vista dei contenuti e di maggiore rilevanza rispetto ai documenti semplici
(ad esempio: Dichiarazione di impegni, valutazione dei capitolati e simili).

In queste situazioni un limite al numero di persone in un ruolo genera forti sbilanciamenti nella distribuzione del carico di lavoro.
Perciò si è potato per una maggiore flessibilità

- Gli autori possono essere assegnati come revisori/verificatori su sezioni non da loro prodotte

- Il revisore o validatore non può operare su contenuti di propria creazione

- Ogni sezione deve essere verificata da almeno un soggetto che non ha partecipato alla sua stesura

- In caso di conflitto di interessi, un possibile validatore validatore si auto-esclude dalla validazione

Il coordinatore del documento (o responsabile, per tradurre in ruoli del progetto) è responsabile del rispetto di queste regole.



=== Aggiornamenti di emergenza
Non è collegato al tipo di documento, ma alla sua priorità. 
In caso si pongano in essere condizioni straordinarie che rendano necessaria una quanto più tempestiva risposta si possono ignorare i criteri sulla rotazione dei ruoli adottando un criterio molto grezzo:"Chi può fare per primo fa),ma mantenendo il vincolo di indipendenza  (Autore $eq.not$ Revisore $eq.not$ Verificatore) 


== Workflow <workflow>
All'interno dell'ambito documentale si è optatpo per il seguente modello per descrivere e modellare le attività necessarie a produrre un documento:
#image(images_dir+"/workflow.drawio.png" )


=== Stati del documento <Workflow>
  - *Backlog*, magazzino delle attività da svolgere, ogni documento inizia in questo stato.
  - *In progress*, il documento è stato preso in carico da un autore.
  - *In review* , il lavoro dell'autore è finito e il documento deve essere revisionato oppure il documento non è stato approvato nella fase "In validazione" e va corretto.
  - *In validazione*, il lavoro del revisore è finito e  il documento va valutato per l'approvazione o respinto fornendo le opportune motivazioni accompagnate da un elenco delle correzzioni da apportare.
  - *Done*, il documento è stato approvato

=== Procedura di avanzamento tra stati <Procedura_Workflow>
  - Da *Backlog* a *In Progress*: un autore si assegna una issue e comincia a scrivere la bozza del documento
  - Da *In progress* a *In review*: l'autore consegna la bozza in stato di revisione, deve portare la issue in revisione, togliersi dagli assegnatari e assegnarla al revisore (deciso a priori) che verrà notificato.
  - Da *In review* a *In validazione*: il revisore ha correto la bozza e propone una revisione al validatore. Deve portare la issue in validazione, togliersi dagli assegnatari e assegnarla al validatore.
  - Da *In validazione* a *In review*: il validatore rifiuta la revisione proposta allegando una lista di errori motivati che il revisore dovrà correggere. Dovrà riassegnare la issue al revisore.
  - Da *In validazione* a *Done*: il validatore accetta la revisione proposta e chiude la issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`]





  == Separazione tra area di rilascio e area di lavoro <separazione>
    Il gruppo si è trovato bene a lavorare usando GitHub per condividere il proprio lavoro e si è scelto di sfruttare le funzionalità di branching per attuare tale separazione.

    A seguito dell'analisi delle best practices, si è giunti alla seguente conclusione: 

    + #upper("è") necessario un branch (main) per il rilascio delle baseline.
    + #upper("è") necessario e sufficiente un singolo branch di lavoro (develop).

  == Tecnologie impiegate
  Per realizzare quanto appena dichiarato sono state adottate le seguenti tecnologie:

  === Area di rilascio e lavoro
  Vengono usate le funzionalità di GitHub, una prima separazione è realizzata usando il branching. \
  L'area di rilascio corrisponde al branch main, i documenti presenti in quest'area sono in stato "Done". \
  L'area di lavoro corrisponde al branch develop, qui vi sono tutti i documenti in lavorazione e completati. \
  Gli allineamenti avvengono tramite merge dei branch.

  Tramite la funzionalità GitHub pages viene resa disponibile una pagina web, al fine semplificare l'accesso ai documenti.

  Tramite GitHub action sono state predisposte automazioni per la compilazione automatica dei documenti .typ -> .pdf una volta pubblicati nell'area di rilascio.

  === Strumenti per la scrittura
  Come Strumento per scrivere la documnetazione è stato scelto typst.

  === Tracciamento delle attività svolte e dei ruoli 
  Si è deciso di tracciare i ruoli assegnati all'interno del documento stesso (nella tabella dello stato del documento e nel registro delle modifiche) e in un foglio di calcolo dedicato.
  Tale foglio di calcolo ha anche lo scopo di facilitare la rotazione dei ruoli, in quanto all'interno delle GitHub issue non viene messo in evidenza il ruolo degli assegnatari ma solo il loro coinvolgimento.

  === Tracciamento del workflow
  Per la modellazione del workflow sono stati usati i seguenti metodi.

  - A ogni documento viene fatto corrispondere un issue, tale issue viene inserito in una project board i cui stati rappresentano gli stati del workflow.
  - A ogni passaggio di stato, l'autore del cambiamento deve assicurarsi di spostare l'issue relativa al documento nella sezione appropriata
  - Per rappresentare il tipo di task, la priorità o altre informazioni rilevanti si sfruttano le funzionalità dell'issue tracking system offerto da GitHub

  Per realizzare la separazione tra area di rilascio e area di lavoro, come già detto si è deciso di sfruttare le funzionalità di braching offerte da GitHub e Git


== Stato dell'arte
=== Scrittura dei commit
#inserisciLink(url:"https://medium.com/@iambonitheuri/the-art-of-writing-meaningful-git-commit-messages-a56887a4cb49")[fonte interessante] \ 
Idea: i commit dovrebbero avere un tipo ed una descrizione: il tipo indica qual è il fine del commit, mentre la descrizione aiuta il lettore esterno a capire quali cambiamenti sono stati fatti. Le regole generali sono:
- iniziare il commit con tipo seguito da ":"
- lasciare uno spazio tra tipo e descrizione
- iniziare la descrizione con una lettera maiuscola
- limitare la descrizione a 50 caratteri

Per modificare un commit ancora in locale risulta utile il comando #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit --amend`]

=== Scrittura delle issue
Una issue deve essere composta da:
- Un titolo descrittivo
- Una descrizione dettagliata, con la consegna che lo sviluppatore deve rispettare
- Label:
    - priorità: alta/media/bassa
- Task 
    - contenuto: verbale interno, verbale esterno …

==== GitHub issue template
// TODO, abbozzare la struttura di un template per la creazione di issue

== Elenco dei documenti <obblighiDoc>
=== Documenti semplici
==== Verbali
  - Nome: YYYY-MM-DD#footnote()[YYYY-MM-DD : Formato della data della riunione]\_Verbale_CONTESTO #footnote()[Interno o esterno]
  - Finalità: Riassuntiva della riunione, agenda, decisioni, azioni.
  - Destinatari: I membri del gruppo
  - Procedure e ruoli: Nella sua realizzazione viene seguito il workflow precedentemente definito nella #underline()[#ref(<workflow>,supplement: "sezione")], i ruoli sono quelli previsti per un #underline()[#ref(<simpleDoc>,supplement: "Documento semplice")]

==== Lettera
// TODO : stilare una descrizione come  quella dei verbali
- Nome: Lettera\_#upper()[finalità]
- Finalità: Comunicare al destinatario un messaggio, ad esempio la lettera di presentazione ha lo scopo di esporre al destinatario la scelta del capitolato, gli impegni presi, ecc...
- Destinatari: Esterni, specificati anche nella lettera.
- Procedure e ruoli:Nella sua realizzazione viene seguito il workflow precedentemente definito nella #underline()[#ref(<workflow>,supplement: "sezione")], i ruoli sono quelli previsti per un #underline()[#ref(<simpleDoc>,supplement: "Documento semplice")]
==== Diario di bordo
// TODO : stilare una descrizione come  quella dei verbali
- Nome: YYYY-MM-DD_Diario_di_bordo
- Finalità: Esporre lo stato di avanzamento del lavoro durante le apposite lezioni.
- Destinatari: Il professore e gli altri gruppi.
- Procedure e ruoli:Nella sua realizzazione viene seguito il workflow precedentemente definito nella #underline()[#ref(<workflow>,supplement: "sezione")], i ruoli sono quelli previsti per un #underline()[#ref(<simpleDoc>,supplement: "Documento semplice")]


=== Documenti gestionali esterni, complessi

==== Piano di Progetto
// TODO : stilare una descrizione come  quella dei verbali

==== Piano di Qualifica
// TODO : stilare una descrizione come  quella dei verbali




=== Documenti gestionali interni, complessi

==== Glossario
// TODO : stilare una descrizione come  quella dei verbali

==== Norme di progetto
// TODO : stilare una descrizione come  quella dei verbali


=== Documenti tecnici esterni

==== Analisi dei requisiti
// TODO : stilare una descrizione come  quella dei verbali
- Nome: Analisi_requisiti.
- Finalità: Stabilisce cosa il sistema (prodotto software) deve fare e quali benefici porta.
- Destinatari: Esterni, BlueWind s.r.l. , professori .
- Ruoli: Nella realizzazione e rotazione dei ruoli vengono adottate le procedure previste per i documenti complessi 
  (#ref(<complexDoc>,supplement: "Sezione" )), vengono anche consumate ore produttive del ruolo *Analista* (#ref(<RuoliProgetto>,supplement: "Ruoli"))
- Struttura: #ref(<strutturaRE>, supplement: "Sezione") .
- Procedure: Iterazione di Requirements elicitation -> Requirements Validation ->Requirements specification -> Requirements elicitation 

==== Specifica tecnica
// TODO : stilare una descrizione come  quella dei verbali

==== Manuale utente
// TODO : stilare una descrizione come  quella dei verbali





]
#insertArabicNumberedPagesSenzaData(PageTitle: "Attività primarie di progetto", documentType: doc)[
= Attività primarie di progetto

== Descrizione dei ruoli <RuoliProgetto>
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
  - Presenza richiesta durante tutto l'arco del progetto
  ],

  [*Analista*: 
  - Svolge le attività di analisi dei requisiti
  - Figura essenziale nella fase iniziale del progetto
  ]  ,

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

== Procvedure di cedimento del ruolo
Al fine di favorire il passaggio di conoscenze alla rotazione dei ruoli.
// TODO


== Ore previste


  #let ruoli = (
    (nome: "Responsabile", costo: 30, oreIndividuali: 11),
    (nome: "Amministratore", costo: 20, oreIndividuali: 9),
    (nome: "Analista", costo: 25, oreIndividuali: 19),
    (nome: "Progettista", costo: 25, oreIndividuali: 17),
    (nome: "Programmatore", costo: 15, oreIndividuali: 17),
    (nome: "Verificatore", costo: 15, oreIndividuali: 18),
  )
  #let acc = (nome: "Totali", oreIndividualiTotali: 0, oreTotali: 0, placeholder: "", costoTot: 0)


  #let analisiImpegni = ()

  #for ruolo in ruoli {
    let oreTot = ruolo.at("oreIndividuali") * 6
    analisiImpegni.push((
      ruolo.at("nome"),
      str(ruolo.at("oreIndividuali")),
      str(oreTot),
      str(ruolo.at("costo")),
      str(ruolo.at("costo") * oreTot),
    ))

    acc.at("oreIndividualiTotali") += ruolo.at("oreIndividuali")
    acc.at("oreTotali") += oreTot
    acc.at("costoTot") += ruolo.at("costo") * oreTot

  }

  #analisiImpegni.push((
    acc.at("nome"),
    str(acc.at("oreIndividualiTotali")),
    str(acc.at("oreTotali")),
    acc.at("placeholder"),
    str(acc.at("costoTot")),
  ))
    #set table(
      stroke: (_, y) => if y == 7 { (top: 1.5pt) },
      // gutter: 0.2em,
      fill: (x, y) => if x == 0 or y == 0 { white },
    )


    #figure(
      caption: [Ripartizione oraria e dettaglio dei costi],
      kind: "Tabella",
      supplement: [Tabella],
    )[
      #utilityTable(
        header: ("Ruolo", "Ore individuali", "Ore Totali", "Costo (€/h)", "Costo totale (€)"),
        columns: (1fr,) * 5,
        analisiImpegni,
      )
    ]<tabella-ore>


== Rendicontazione delle ore
Al fine di rendicontare e monitorare le ore il gruppo si è dotato di un foglio di calcolo google sheet.
In esso sono rendicontate le ore dedicate ai ruoli di progetto, per ciascun membro del gruppo sono visibili il ruolo, le ore previste e le ore effettive relative a ciascun periodo di avanzamento.


== Distribuzione dei ruoli
Nel seguente paragrafo si delinea la distribuzione dei ruoli lungo la durata del progetto.



=== Fase di analisi
  #upper("è") la fase che va dalla assegnazione della candidatura alla *RTB*.
  Le attività principali individuate durante questa fase sono:
  - *L'analisi dei requisiti*, fissa i requisiti da soddisfare, in accordo con il proponente
  - *La proof of concept*, dimostra adeguatezza e interoperabilità le tecnologie, i framework, le librerie adottate (non è una demo).

  Ciò porta alla conclusione che in questa fase verrano investite tutte le ore del ruolo analista questa fase.
  Verranno anche investite ore di progettista, programmatore e verificatore per la realizzazione della proof of concept.
  Responsabile e amministratore sono ruoli che avranno rilevanza lungo tutta la durata del progetto.

=== Fase di realizzazione
Vaglia la maturità della baseline architetturale del prodotto software e la sua realizzazione (*PB*).
In questa fase verrann consumate le rimanenti ore, le attività richiederanno il lavoro di progettista, programmatore e verificatore

== Strumenti per il controllo di avanzamento
// TODO, approfondire
Al momento non vi è separazione tra la rendicontazione delle ore e il controllo dell'avanzamento

== Metodi per l'apprendimento di un nuovo ruolo

// TODO, approfondire
// - Pair-working con membri esperti del ruolo
// - Documentazione interna di best practices
// - Sessioni di knowledge sharing settimanali
// - Shadowing durante le attività complesse


== Risoluzione dei conflitti
// TODO, approfondire

// - Disaccordi tecnici: discussione di 15 minuti + votazione a maggioranza
// - Disaccordi personali: mediazione del Responsabile


]


#insertArabicNumberedPagesSenzaData(PageTitle: "Appendice", documentType: doc)[
= Appendice

== Struttura dei documenti
Qui viene descritta la struttura dei vari documenti:

//TODO
  == Criteri di classificazione dei documenti
(Analizzati anche nella #ref(<obblighiDoc>,supplement: "Sezione: Elenco dei documenti") )
  - Complessità.
  - Destinatari.
  - Priorità.
  - Frequenza. 

 === Specifiche dei documenti

// ==== Verbali
// Template requirements:
// - Decision log format
// - Action item tracking
// - Participant attendance
// - Follow-up responsibility assignment

// Quality standards:
// - 24-hour delivery deadline
// - Action item completion tracking
// - Decision implementation verification

// ==== Piano di Progetto
// Content requirements:
// - Risk management section
// - Resource allocation details
// - Milestone dependencies
// - Contingency planning
// 
// 
==== Analisi dei requisiti <strutturaRE>
Documento complesso la cui scrittura è continuativa per vari periodi di avanzamento. \
La struttura generale del documento è la seguente:
#enum(numbering: "1.1)", full: true,
[Informazioni generali:
+ Frontespizio introduttivo
+ Tabella dello stato del documento
+ Registro delle modifiche
+ Indice dei contenuti
],
[Introduzione],
[User requirements],
[System requirements
#enum(
  [Requisiti funzionali],
  [Requisiti non funzionali
    #enum(
      [Product requirements],
      [Organization requirements],
      [External requirements])])
],
[],
[],

)
]