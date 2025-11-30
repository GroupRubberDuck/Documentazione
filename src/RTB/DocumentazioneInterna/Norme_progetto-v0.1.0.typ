#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage, frontPageSenzaData
#import template_dir + "/setUpPageLayout.typ": *
#import "@preview/cheq:0.3.0": checklist
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
    versione: "0.5",
    autori: ("Davide Lorenzon", "Aldo Bettega", "Guerra Filippo", "Ana Maria Draghici"),
    verificatori: ("Ana Maria Draghici",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1],[2025-11-],[Davide Lorenzon],[-],[Stesura iniziale]),
  ([0.2],[2025-11-11],[Davide Lorenzon],[-],[Aggiunta struttura dei documenti (come stabilito da verbale 2025-11-10)]),
  ([0.3],[2025-11-11],[Ana Maria Draghici],[-],[Aggiornata strutturaRE con le modifiche alla scaletta AdR]),
  ([0.4],[2025-11-29],[Guerra	Filippo],[Ana Maria Draghici],[Aggiunta sezione ruolo-documento]),
  ([0.5],[2025-11-30],[Ana Maria Draghici],[-],[Aggiunta sezione Definition of Done e Issue tracking System]),


  
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
Ogni documento presenta una sezione iniziale standarizzata per tutti i membri del team. 
Questa sezione viene generata utilizzando un apposito template centrale e unico, al fine di garantire coerenza e facilitare la compilazione. 

La sezione iniziale è composta dai seguenti elementi: 

*1. Pagina di copertina* contenenete il titolo del documento, il nome e il logo del gruppo e le relative informazioni di contatto.

*2. Tabella dello stato * che riassume lo stato del documento e informazioni generali quali versione, autori, verificatori, uso e destinatari.

*3. Registro delle modifiche * costituito da una tabella contenente le informazioni sul versionamento e sulla tracciabilità.

*4. Indice dei contenuti * aggiornato automaticamente  tramite sintassi Typst.

*5. Indice delle immagini e delle tabelle* presente solo nei documenti che ne contengono. 

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

==== Piano di Progetto
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
Ogni documento identificato all'interno dello sviluppo software deve rispettare alcuni standard di documentazione uguali per tutti: 
#pad(left: 1em)[
  - Essere in formato A4; 
  - I contenuti inseriti devono essere coerenti con lo scopo del documento stesso, definito nella sezione #ref(<identif>) di questo documento;
  - Tutti i documenti devono includere un indice dei contenuti e delle relative sottosezioni visibile all'inizio (ad eccezione del diario di bordo, che ne è esentato);
  - Ogni pagina deve contenere nell'header e nel footer:
   1. La sezione corrente del documento (in alto a sinistra);
   2. Il nome del gruppo (in alto a destra);
   3. Il titolo del documento (in basso a sinistra);
   4. Il numero della pagina : espresso in numeri romani per la prefazione e in numeri arabi per le pagine del corpo del documento. 
]
Per la redazione dei documenti è corretto e necessario fare riferimento a fonti autorevoli e aggiornate, quali standard ISO, università e organizzazioni ufficialmente riconosciute, materiale didattico e link di approfondimento forniti durante il corso. Eventuali informazioni provenienti da altre fonti, se ritenute utili, devono essere obbligatoriamente verificate per accertarne la correttezza e l'affidabilità.


=== Produzione 
I documenti vengono ricompilati automaticamente in PDF tramite GitHub Action e sono consultabili da tutti i membri del team.
Sono disponibili nella repository del gruppo dedicata alla #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].  

Per facilitarne la consultazione è inoltre possibile accedere al  #link("https://grouprubberduck.github.io/Documentazione")[sito web ufficiale] del gruppo, creato appositamente per visualizzare e navigare i documenti in modo più immediato.

La versione del documento e la tracciabilità delle modifiche sono gestite tramite il Registro delle Modifiche, integrato direttamente all’interno di ciascun documento.


=== Manutenzione 


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Organizzativi", documentType: doc)[
= Processi Organizzativi
== Gestione del Processo
=== Ruoli di Progetto
La seguente sezione descrive le fasi della progettazione software.
All’interno del team, per garantire coerenza, efficienza e qualità, ogni ruolo ha compiti specifici e interviene in momenti diversi del progetto.

Nel contesto del corso di Ingegneria del Software, tutti i membri del team devono ricoprire almeno una volta ciascun ruolo definito.

La tabella sottostante riassume in maniera chiara i compiti associati a ciascun ruolo.


// -------- TIMELINE VISIVA --------
#align(center)[
  *Fasi di progetto*\
  #v(6pt)
  ── ● *Analisi* ──▶ ● *Progettazione* ──▶ ● *Implementazione* ──▶ ● *Verifica*
#{
  show table.cell: set text(size: 11pt)
  table(
    columns: 3,
    align: horizon,
    table.header([*Ruolo*],[*Compiti*],[*Presenza*]),

    [Responsabile], "- Coordinamento piani e scadenze\n- Approvazione release\n- Comunicazione col committente\n- Uso efficiente delle risorse\n- Redazione documenti", [Tutto il progetto],

    [Amministratore], "- Garanzia efficienza strumenti\n- Gestione tecnologie di supporto\n- Verifica procedure secondo norme", [Tutto il progetto],

    [Verificatore], "- Testing e validazione\n- Controllo qualità deliverable\n- Conformità ai requisiti", [Tutto il progetto],

    [Analista], "- Analisi dei requisiti\n- Definizione bisogni del sistema\n- Redazione specifiche funzionali", [Fase iniziale],

    [Progettista], "- Progetta architettura sistema\n- Design e modellazione\n- Traduzione requisiti in struttura tecnica", [Dopo analisi],

    [Programmatore], "- Codifica software\n- Implementazione design\n- Sviluppo funzionalità", [Implementazione],
  )
}

]

== Assegnazione Ruolo-Documento
La seguente sezione chiarisce i documenti associati a ciascun ruolo.\
L’assegnazione viene rappresentata tramite una *legenda* e una *tabella riassuntiva*. \

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

== Definition of Done (DoD)
La *Definition of Done (DoD)* è un elemento molto importante nello sviluppo software, perché definisce le azioni che devono essere completate affinché i requisiti — espressi tramite un *Product Backlog Item (PBI)* — siano considerati conclusi. \
I criteri che la compongono devono essere concreti, verificabili e di dimensione ridotta, e hanno l’obiettivo di garantire un livello minimo di qualità per ogni rilascio o incremento del prodotto.

Di seguito viene riportata la Definition of Done per la fase RTB:

#show: checklist.with(marker-map: (" ": sym.ballot, "x": sym.ballot.cross, "-": sym.bar.h, "/": sym.slash.double))

- [ ] Controllare a livello semantico e grammaticale che tutto sia corretto (grammatica, punteggiatura, sintassi, rivedere frasi ripetute/ mal espresse)

- [ ] Controllare di aver incluso tutte le sezioni definite del WoW nel documento su cui si lavora 

- [ ] Controllare di aver aggiornato la versione, lo stato e gli autori ( “status TAB” ), per includere le ultime modifiche
- [ ] Controllare di aver aggiunto le ultime modifiche anche sulla “tabella delle modifiche del documento”
- [ ] Nei verbali, controllare che tutte le decisioni corrispondano a issue specifiche nell’issue template.
- [ ] Un documento ( o una sua sezione) è considerato completato quando:
- È stato scritto;
- È stato verificato;
- È stata aggiunta una riga nelle tabelle documentarie con il validatore finale.

- [ ] Quando il documento/prodotto è completato, chiudere l’issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`] Verificare poi effettivamente la chiusura nel Projects Board.

- [ ] Quando tutti i punti sopra sono completati e tutte le issue sono spostate in “Done”:
- Il branch develop può essere unito a main
- Controllare l’incremento dello sprint corrispondente ( e il website)
  
La seguente *Definition of Done* non è statica, ma dinamica: evolve in base alle esigenze del team di sviluppo.

== Issue tracking System – Guida Operativa
L'*Issue Tracking System* è lo strumento utilizzato dal nostro team di sviluppo per tracciare in maniera efficiente tutte le issue da svolgere e il loro stato di completamento.
Il sistema è accessibile a tutti i membri del gruppo attraverso la repository Github, dove è disponibile un *template di issue condiviso e centrale*, in modo da evitare incongruenze o confusione.

// stati dell'issue -> quando si avrà immagine del workflow
=== Creazione di una nuova issue
A seguito di verbali interni o esterni, il gruppo decide le attività su cui concentrarsi. 
L'*amministratore* ha il compito di creare le issue nel sistema utilizzando il *template condiviso*.

Ogni nuova issue deve includere:

*1. Assegnatario/i* \
Generalmente è preferibile assegnare la issue a una sola persona. Tuttavia, per attività di formazione o esercitazioni ("palestra") si possono assegnare più persone o l'intero gruppo. 

*2. Descrizione*\
Una spiegazione dettagliata e specifica delle azioni da svolgere.

*3. Scopo*\
Indica cosa ci si aspetta di ottenere al termine dell'issue e dove andrà documentato il risultato (ad esempio, in quale documento o sezione del repository).

*4. Autore*\
La persona che ha ideato l'issue (solitamente l'amministratore).

*5. Verificatore*\
La persona incaricata di controllare e approvare l'issue quando viene spostata nello stato di verifica.

*6. Label (ambito/destinazione)*\
Permette di classificare la issue in base al suo ambito: 
- Esterno -> documentazione rivolta anche all’esterno del gruppo  
- Interno -> documentazione utile solo all'interno del gruppo

*7. Tipo di issue (Type)*\
Permette di distinguere la natura delle attività:
- Palestra -> ore formative non rendicontate, attività di ricerca o di studio 
- Produttivo -> ore rendicontate con risultati concreti, come la scrittura di documenti da presentare  
- Bug -> correzione di errori, sia su documenti che su codice o sistemi interni.

*8. Priorità : Bassa, Media, Alta * \
Il gruppo concentra le proprie energie prima sulle issue ad alta priorità.

*9. Dimensione : ExtraSmall, Small, Medium, Large * \
Serve per stimare la complessità o l'impegno richiesto.

*10. Data di scadenza*\
Normalmente coincide con la fine dello sprint di riferimento. 

=== Flusso operativo

1. L’amministratore crea una nuova issue tramite il template condiviso.
   
2. Si assegnano autore, verificatore e assegnatario/i.

3. Si compilano descrizione, scopo, label, type, priorità, dimensione, scadenza. 

4. La issue viene inserita nello stato iniziale Backlog e segue il flusso fino a Done.

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


