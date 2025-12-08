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
    versione: "0.6.0",
    autori: ("Davide Lorenzon", "Aldo Bettega", "Guerra Filippo", "Ana Maria Draghici"),
    verificatori: ("Ana Maria Draghici", "Davide Lorenzon", "Aldo Bettega" ),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Registro modifiche", documentType: doc)[


#let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
#let modifiche=(

  ([0.1.0],[2025-11-],[Davide Lorenzon],[Ana Maria Draghici],[Stesura iniziale]),
  ([0.2.0],[2025-11-11],[Davide Lorenzon],[Ana Maria Draghici],[Aggiunta struttura dei documenti (come stabilito da verbale 2025-11-10)]),
  ([0.3.0],[2025-11-11],[Ana Maria Draghici],[Aldo Bettega],[Aggiunta sezione 4.8.1 struttura Analisi Requisiti ]),
  ([0.4.0],[2025-11-29],[Guerra	Filippo],[Ana Maria Draghici],[Aggiunta sezione 5.2 "ruolo-documento"]),
  ([0.5.0],[2025-11-30],[Ana Maria Draghici],[Aldo Bettega],[Aggiunta sezione 5.3 e 5.4, rispettivamente  "Definition of Done" e "Issue tracking System"]),
  ([0.6.0],[2025-12-02],[Ana Maria Draghici],[Aldo Bettega],[Aggiunta sezione 4.8 "struttura specifica dei documenti" e relative sottosezioni, aggiunto sezione 5.4.3 "Versionamento"]),
  ([0.7.0],[2025-12-04],[Aldo Bettega],[-],[Aggiunta sezione 4.8.4.1/2 e sezione 9]),


  
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

In questo documento il gruppo definisce e mantiene traccia del proprio way of working, ovvero l’insieme di pratiche e convenzioni adottate per organizzare e svolgere il lavoro di progetto.

La stesura del documento avviene in modo incrementale, evolvendosi parallelamente all’avanzamento delle attività. Nel corso del progetto potrà essere soggetto ad aggiunte, modifiche o rimozioni, derivate dal processo di apprendimento e sperimentazione del team.

Tali aggiornamenti nascono dall’analisi e dall’evoluzione delle best practices comuni nell’ingegneria del software, che il gruppo studia, applica e adatta in funzione delle esigenze del team e del contesto progettuale.

  == Scopo del prodotto
Il prodotto sviluppato è un’applicazione software progettata per verificare in modo automatico la conformità alla norma EN 18031, lo standard tecnico europeo che definisce i requisiti di sicurezza informatica per i dispositivi radio wireless (es. Wi-Fi, LTE, Bluetooth, IoT wireless).

L’obiettivo dell’applicazione è supportare e guidare l’utente nella valutazione dei requisiti di cybersecurity, eseguendo in autonomia i percorsi decisionali tramite decision tree (alberi di decisione).
Questo approccio permette di accelerare, standardizzare e rendere più affidabile il processo di verifica della conformità, con la generazione automatica della documentazione tecnica richiesta a supporto dell’assessment. 
  == Glossario
  Per garantire precisione terminologica senza compromettere la leggibilità, in questo documento viene adottato un approccio ibrido alla gestione dei riferimenti al Glossario.
  I termini tecnici possono essere presentati secondo 2 modalità:

  - *Footnote al primo utilizzo*: applicata ai concetti critici o potenzialmente ambigui, permette un accesso immediato alla definizione senza interrompere il flusso logico del testo.

  - *Marcatura tramite pedice “G” (termine #sub()[G])*: utilizzata per termini ricorrenti o già contestualizzati, indica semplicemente la presenza del termine nel Glossario.

// da definire bene meglio una volta che effettivamente viene usato per bene
  


]

#insertArabicNumberedPagesSenzaData(PageTitle: "Riferimenti", documentType: doc)[
  = Riferimenti
== Riferimenti normativi
  - #link("https://galileodiscovery.unipd.it/discovery/fulldisplay?docid=alma9938989417806046&context=L&vid=39UPD_INST:VU1&lang=it&search_scope=catalogo_no_external&adaptor=Local%20Search%20Engine&tab=Everything&query=title,contains,Software%20Engineering,AND&query=creator,contains,Ian%20Sommerville,AND&mode=advanced")[Software Engineering, Ian Sommerville]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento progetto]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto Automated EN18031
Compliance Verification di BlueWind]
- #link("https://www.iso.org/standard/63712.html")[Standard ISO 12207:2017]
== Riferimenti informativi

- #link("https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/managing-issue-types-in-an-organization") 
- #link("https://www.agileway.it/definition-of-done-dod-cose-cosa-serve/")
- #link("https://www.atlassian.com/agile/project-management/definition-of-done")




]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi Primari", documentType: doc)[
  = Processi Primari
]

#insertArabicNumberedPagesSenzaData(PageTitle: "Processi di Supporto", documentType: doc)[
= Processi di Supporto
== Documentazione

Il processo di documentazione ha lo scopo di registrare e rendere disponibili le informazioni prodotte dai processi primari del progetto.

Consente di tracciare con maggiore efficacia le decisioni adottate, ridurre il rischio di ambiguità, evitare fraintendimenti e facilitare l’organizzazione del *lavoro asincrono e collaborativo*.

Le principali attività che compongono questo processo sono:
#pad(left: 1em)[ 
1. *Progettazione e sviluppo del documento* → definizione della struttura e stesura dei contenuti;

2. *Implementazione del processo documentale* → applicazione delle norme e del workflow stabilito;

3. *Produzione* → generazione del documento in formato destinato alla distribuzione;

4. *Manutenzione* → aggiornamento continuo del contenuto e gestione delle modifiche;

5. *Archiviazione e tracciabilità* → versionamento, conservazione e accessibilità nel tempo.
]
=== Workflow documentale
All'interno dell'ambito documentale è stato optato il seguente modello per descrivere e modellare le attività necessarie a produrre un documento:
#image(images_dir+"/workflow.drawio.png" )

==== Stati del documento <Workflow>
  - *Backlog*: magazzino delle attività da svolgere, ogni documento inizia in questo stato.
  - *In lavorazione*: il documento è stato preso in carico da un autore.
  - *In verifica*: Il lavoro dell’autore è terminato. Il documento deve ora essere verificato oppure corretto, nel caso in cui non sia stato approvato durante la fase di approvazione.
  - *In approvazione*, il lavoro del verificatore è finito. Il documento va valutato per l'approvazione oppure respinto, fornendo le opportune motivazioni accompagnate da un elenco delle correzioni da apportare.
  - *Done*, il documento è stato approvato.

==== Procedura di avanzamento tra stati <Procedura_Workflow>
  - Da *Backlog* a *In lavorazione*: un autore si assegna una issue e inizia a scrivere la bozza del documento.
  - Da *In lavorazione* a *In verifica*: l'autore consegna la bozza, trasferendo la issue in verifica e assegnandola al verificatore (deciso a priori) che verrà notificato automaticamente.
  - Da *In verifica* a *In approvazione*: il verificatore ha apportato modifiche alla bozza e propone la verifica al responsabile. Il verificatore deve spostare la issue in approvazione e assegnarla al responsabile.
  - Da *In approvazione* a *In verifica*: il responsabile rifiuta la verifica proposta allegando una lista di modifiche motivate che il verificatore dovrà apportare al documento. Il responsabile dovrà riassegnare la issue al verificatore.
  - Da *In approvazione* a *Done*: il responsabile accetta la verifica proposta e chiude la issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`]


=== Strumenti di supporto

*Typst*: Linguaggio di markup moderno per la composizione e la tipografia di documenti, pensato come alternativa più semplice e veloce a LaTeX.
#pad(left: 1em)[
- Sintassi intuitiva;
- Supporto ad automazioni tramite template, funzioni e regole di stile riutilizzabili;
- Preview istantanea del documento.
]

*GitHub*: Strumento scelto dal gruppo per la condivisione del lavoro e la gestione delle attività tramite *issue tracking*.
#pad(left: 1em)[ 
- Utilizzo di GitHub Actions per la compilazione automatica dei documenti.
- Documentazione disponibile nel repository #link("https://github.com/GroupRubberDuck/Documentazione")[GitHub].
- #link("https://grouprubberduck.github.io/Documentazione")[Sito web] predisposto tramite GitHub Pages per facilitare la consultazione della documentazione.
]

*TurboScribe AI*: Per velocizzare il processo, il gruppo utilizza il tool AI #link("https://turboscribe.ai/it")[TurboScribe] che consente di trascrivere facilmente da registrazioni audio, utile per funzionalità come il riascolto di momenti specifici della riunione tramite selezione testuale.

== Identificazione dei documenti <identif>
  Si tratta di una fase di pianificazione in cui ogni documento viene definito secondo le seguenti caratteristiche principali:

#pad(left: 1em)[
- Titolo;
- Scopo;
- Destinatari;
- Procedure e responsabilità nella redazione e gestione del documento;
- Contenuto effettivo specifico per ciascun documento.
]


== Progettazione dei documenti
Ogni documento identificato all'interno dello sviluppo software deve rispettare alcuni standard di documentazione uguali per tutti: 
#pad(left: 1em)[
  - Essere in formato A4; 
  - I contenuti inseriti devono essere coerenti con lo scopo del documento stesso;
  - Tutti i documenti devono includere un indice dei contenuti e delle relative sottosezioni visibile all'inizio (ad eccezione del diario di bordo, che ne è esentato);
  - Ogni pagina deve contenere nell'header e nel footer:
   1. La sezione corrente del documento (in alto a sinistra);
   2. Il nome del gruppo (in alto a destra);
   3. Il titolo del documento (in basso a sinistra);
   4. Il numero della pagina : espresso in numeri romani per la prefazione e in numeri arabi per le pagine del corpo del documento. 
]
Per la redazione dei documenti è corretto e necessario fare riferimento a fonti autorevoli e aggiornate, quali standard ISO, università e organizzazioni ufficialmente riconosciute, materiale didattico e link di approfondimento forniti durante il corso. Eventuali informazioni provenienti da altre fonti, se ritenute utili, devono essere obbligatoriamente verificate per accertarne la correttezza e l'affidabilità.


== Pubblicazione e Distribuzione della Documentazione
I documenti vengono ricompilati automaticamente in PDF tramite GitHub Action e sono consultabili da tutti i membri del team.
Sono disponibili nella repository del gruppo dedicata alla #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].
La posizione ufficiale dei file è indicata nel README.md del repository.  

Per facilitarne la consultazione è inoltre possibile accedere al  #link("https://grouprubberduck.github.io/Documentazione")[sito web ufficiale] del gruppo, creato appositamente per visualizzare e navigare i documenti in modo più immediato. 

La versione del documento e la tracciabilità delle modifiche sono gestite tramite il Registro delle Modifiche, integrato direttamente all’interno di ciascun documento.

== Impegno del gruppo nella produzione della documentazione

Il gruppo si impegna a fornire alla proponente e ai docenti tutta la documentazione necessaria a supportare le attività di analisi, progettazione, sviluppo e verifica del progetto.
Tale documentazione ha lo scopo di garantire trasparenza, tracciabilità e qualità del lavoro svolto, oltre a costituire un riferimento chiaro per tutti gli stakeholder coinvolti.

== Informazioni comuni <informazioni_comuni>
Ogni documento presenta una sezione iniziale standardizzata per tutti i membri del team. 
Questa sezione viene generata utilizzando un apposito template centrale e unico, al fine di garantire coerenza e facilitare la compilazione. 

La sezione iniziale è composta dai seguenti elementi: 
#pad(left: 1em)[
*1. Pagina di copertina* contenenete il titolo del documento, il nome e il logo del gruppo e le relative informazioni di contatto.

*2. Tabella dello stato * che riassume lo stato del documento e informazioni generali quali versione, autori, verificatori, uso e destinatari.

*3. Registro delle modifiche * costituito da una tabella contenente le informazioni sul versionamento e sulla tracciabilità.

*4. Indice dei contenuti * aggiornato automaticamente  tramite sintassi Typst.

*5. Indice delle immagini e delle tabelle* presente solo nei documenti che ne contengono. 
]



== Documentazione prevista per la fase RTB

La documentazione fornita in corrispondenza della fase RTB (Requirements and Technology Baseline) comprende sia materiali tecnici sia documenti operativi e organizzativi, al fine di garantire una valutazione completa e trasparente dello stato del progetto.

In particolare, vengono prodotti:

*Documenti tecnici* : 
#pad(left: 1em)[
- Analisi dei Requisiti (AdR);
- Piano di Progetto (PdP);
- Piano di Qualifica (PdQ);
- Preventivo dei Costi e delle risorse impiegate;
]
*Documenti operativi e organizzativi*
#pad(left: 1em)[
- Norme di Progetto (NdP);
- Verbali interni;
- Verbali esterni;
- Glossario;
- Diario di bordo.
]



== Struttura specifica dei documenti 

Di seguito viene riportata la struttura standard dei documenti principali, le rispettive sezioni, il loro scopo, i destinatari, e le metodologie adottate per la scrittura e la revisione, al fine di mantenere coerenza e uniformità all'interno del gruppo. 

=== Analisi dei Requisiti
L’Analisi dei Requisiti ha il compito di descrivere in modo completo, chiaro e verificabile tutte le funzionalità che il sistema deve offrire, includendo sia requisiti funzionali sia non funzionali. Il documento fornisce inoltre i principali casi d’uso, con attori e scenari associati, e garantisce la tracciabilità tra requisiti, casi d’uso ed eventuali estensioni future. Rappresenta un riferimento stabile per sviluppatori, tester e manutentori durante tutte le fasi del progetto.

*Destinatari*: stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)

==== Struttura principale 
Il documento comprende:
#pad(left: 1em)[
- Definizione formale dei requisiti funzionali e non funzionali;

- Modellazione dei casi d’uso con attori e flussi narrativi;

- Matrice di tracciabilità requisiti–casi d’uso;

- Eventuali vincoli tecnici, operativi o di contesto.

]

=== Piano di Progetto

Il Piano di Progetto definisce la pianificazione complessiva del lavoro, descrivendo l’approccio plan–driven adottato dal gruppo. Documenta obiettivi, risorse, ruoli, tempistiche e rischi, fornendo una visione strutturata dell’organizzazione del progetto. Ha inoltre lo scopo di monitorare l’avanzamento attraverso revisioni periodiche e rendicontazioni per sprint.

*Destinatari* : stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)

==== Struttura principale 

La struttura del documento comprende:
#pad(left: 1em)[

- Ambito e obiettivi del progetto;

- Preventivo iniziale e disponibilità delle risorse;

- Analisi dei rischi e piano di mitigazione;

- Distribuzione dei ruoli e pianificazione temporale;

- Sezione dedicata alle revisioni, con per ogni sprint:
#pad(left: 1em)[
- *Retrospettiva del gruppo* → riflessioni su apprendimento, workflow ed efficacia della collaborazione

- *Attività pianificate* → obiettivi e task previsti per il periodo di sprint

- *Rischi e difficoltà emersi* → analisi degli impedimenti riscontrati e strategie di mitigazione

- *Preventivo ore per ruolo* → stima dell’effort pianificato, suddiviso per responsabilità

- *Consuntivo ore effettive* → ore realmente impiegate dal gruppo nel periodo

]


=== Piano di Qualifica 

Il piano di qualifica ha l’obiettivo di garantire che il prodotto sviluppato rispetti elevati standard di qualità. Definisce processi, metriche, strategie di testing e criteri di valutazione necessari a verificare la qualità del software e del processo di sviluppo. Fornisce inoltre strumenti operativi per la misurazione e la validazione dei risultati.

*Destinatari* : stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)


==== Struttura principale

Il documento è articolato nelle seguenti componenti:
#pad(left: 1em)[

- Metriche di qualità del prodotto e del processo;

- Strategie, livelli e tecniche di testing;

- Piano delle verifiche e validazioni;

- Cruscotto qualità con indicatori e soglie di accettazione;
]


]

=== Verbali

I verbali sono suddivisi in due categorie principali : 
#pad(left: 1em)[
- Verbali interni -> documentano riflessioni e confronti avvenuti esclusivamente tra i membri del gruppo.
- Verbali esterni -> vengono redatti in corrispondenza di riunioni o confronti con l'azienda di riferimento (Bluewind).

Ogni verbale si conclude con una *riflessione finale del gruppo*, dalla quale emergono decisioni operative che vengono successivamente formalizzate tramite la creazione di *issue GitHub*, che il gruppo si impegna a completare. 
]

==== Struttura principale

Ogni verbale deve avere la seguente suddivisione numerata: 
#pad(left: 1em)[
  1. *Informazioni comuni della sezione 4.1.2.1* (standard condivisi di documento)
  2. *Informazioni generali*
      #pad(left: 1em)[
        - Data e luogo della riunione
        - Orario di inizio/fine
        - Partecipanti
        - Tipo(interno/esterno)
        - Motivo (principalmente per verbali esterni)
        - Scriba (responsabile del verbale in quel momento)
]
    3. *Ordine del giorno* 
    #pad(left: 1em)[
    - Scaletta dei temi da discutere, raccolti e organizzati del responsabile sulla base dei contributi dei membri del gruppo o dei referenti aziendali. 
]
    4. *Riassunto della riunione* 
    #pad(left: 1em)[
    - Sintesi breve e oggettiva dei punti discussi.
]
    5. *Decisioni * 
    #pad(left: 1em)[
    - Azioni o obiettivi (anche ad alto livello) che il gruppo deve intraprendere per dare seguito alla riunione.
]
    6. *TODO* 
    #pad(left: 1em)[
    - Attività specifiche derivate dalle decisioni. Una singola decisione può essere suddivisa in più TODO, che complessivamente consentono di raggiungere l'obiettivo stabilito. 
]
]

=== Diario di Bordo

Il Diario di bordo è un’attività prevista dal Prof. Tullio Vardanega all’interno del progetto di Ingegneria del Software. Rappresenta un momento di condivisione in cui ciascun gruppo espone il proprio stato di avanzamento, con particolare attenzione a dubbi o problematiche emerse durante lo svolgimento delle attività.

Composto principalmente da: 
#pad(left: 1em)[
*Titolo*: Diario di bordo seguito dal numero progressivo associato.

*Scopo*: Fornire ai gruppi un feedback sulle attività svolte e consentire di portare all’attenzione comune eventuali dubbi relativi al processo di lavoro.

*Destinatari*: Prof. Tullio Vardanega e gli altri gruppi coinvolti nel progetto.
]

=== Norme di Progetto (NdP)

Le Norme di Progetto hanno l’obiettivo di definire regole, convenzioni e standard condivisi all’interno del gruppo, al fine di garantire coerenza, qualità e uniformità nella produzione di documenti, codice e deliverable.  
Esse servono a stabilire procedure comuni per redazione, revisione, versionamento, gestione dei file e comunicazione interna, riducendo il rischio di errori, ambiguità o incongruenze tra i membri del team.

*Destinatari* : Tutti i membri del gruppo di progetto

==== Struttura principale  
Il documento delle Norme di Progetto è organizzato in sezioni facilmente consultabili riassunte in:  
#pad(left: 1em)[
- *Convezioni sui documenti*: formato, intestazioni, footer, numerazione pagine, stili e template Typst da utilizzare.  
- *Processo di redazione e revisione*: ruoli coinvolti, responsabilità, iter di approvazione, gestione modifiche e versionamento.  
- *Standard di codifica e naming*: linee guida per nomi di file, classi, funzioni e repository, se applicabile al progetto software.  
- *Procedure operative comuni*: modalità di collaborazione, uso di strumenti (GitHub, Issue Tracking, AI tools), backup e archiviazione.  
- *Tracciabilità e registri*: indicazioni per mantenere il Registro delle Modifiche aggiornato e verificabile.  
- *Definizione della qualità minima*: criteri generali per accettazione dei documenti e dei deliverable.
]


]




=== Manutenzione 




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
  #sym.bar.h ● *Analisi* #sym.arrow.r ● *Progettazione* #sym.arrow.r ● *Implementazione* #sym.arrow.r ● *Verifica*
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

- [ ] *Nei verbali*: Controllare di aver aggiornato nello status TAB: 
  - stato
  - versione
  - ruoli
- [ ] Controllare di aver aggiunto le ultime modifiche anche sulla “tabella delle modifiche del documento”
- [ ] *Nei verbali*: controllare di aver aggiornato la versione nel nome del file
- [ ] *Nei verbali*, controllare che tutte le decisioni corrispondano a issue specifiche nell'issue template.
- [ ] Un documento (o una sua sezione) è considerato completato quando:
  - È stato scritto;
  - È stato verificato;
  - È stata aggiunta una riga nelle tabelle documentarie con il validatore finale.

- [ ] Quando il documento/prodotto è completato, chiudere la issue con #block(
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
Il sistema è accessibile a tutti i membri del gruppo attraverso la repository GitHub, dove è disponibile un *template di issue condiviso e centrale*, in modo da evitare incongruenze o confusione.

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
La persona che deve svolgere la issue.

*5. Verificatore*\
La persona incaricata di verificare che la issue sia stata risolta correttamente, in base alla Definition of Done. Il verificatore, a meno di eccezioni, è diversa dall'autore.

*6. Label (ambito/destinazione)*\
Questa classificazione consente di organizzare le issue in base al loro ambito o posizione all’interno del progetto: 
- Analisi dei requisiti 
- Piano di progetto 
- Piano di qualifica 
- Norme progetto
- Verbale
- Diario di bordo
- Glossario 
- Generale -> attività che non rientrano nei documenti sopra: studio di materiale aziendale, lavori sul sito web, gestione repository, attività varie fuori dai documenti principali
*7. Tipo di issue (Type)*\
Permette di distinguere la natura delle attività:
- Palestra -> ore formative non rendicontate, attività di ricerca o di studio 
- Produttivo -> ore rendicontate con risultati concreti, come la scrittura di documenti da presentare  
- Bug -> errori o malfunzionamenti nel codice
- Correzione -> interventi su documenti o materiali già prodotti per migliorarli, aggiornarli o correggere inesattezze
*8. Priorità: Bassa, Media, Alta * \
Questa suddivisione ha due scopi:
- ragionare sull'importanza della issue che si sta scrivendo
- comunicare all'assegnatario con quale tempestività dovrà svolgere la issue

*9. Dimensione : ExtraSmall, Small, Medium, Large * \
Serve per stimare la mole di lavoro necessaria per portare a termine quella issue.

*10. Data di scadenza*\
Normalmente coincide con la fine dello sprint di riferimento. 

=== Flusso operativo

1. L’amministratore crea una nuova issue tramite il template condiviso.
   
2. Si assegnano autore/i e verificatore/i.

3. Si compilano descrizione, scopo, label, type, priorità, dimensione, assegnatario, scadenza, milestone. 

4. La issue viene inserita nello stato iniziale Backlog e segue il flusso fino a Done.



=== Versionamento
In questa sezione viene spiegata la logica di versionamento dei documenti.

==== Codice di versione

Ogni modifica apportata a un documento genera automaticamente una nuova versione, identificata tramite un codice nel formato:

#align(center, block[
  #set align(left)
  *X.Y.Z*
])

dove ciascuna componente rappresenta uno stato diverso del processo di validazione:

#pad(left: 1em)[
- *X – Versione stabile approvata*  
- 
  Indica l’ultima versione ufficialmente approvata dal Responsabile.  
  Il suo incremento segnala una revisione sostanziale o una modifica di grande rilievo.  
  L’incremento di X comporta l’azzeramento automatico di Y e Z.

- *Y – Feature proposta / Approvazione generale*  
  
  Rappresenta l’ultima approvazione da parte di un Verificatore.  
  Il suo incremento indica l’introduzione o modifica di una nuova funzionalità o sezione del documento.  
  L’incremento di Y comporta l’azzeramento di Z.

- *Z – Patch della feature proposta / Modifica verificata*  
  
  Indica l’ultima modifica di dettaglio verificata (correzioni minori, refusi, aggiustamenti formali).  
  L’incremento di Z rappresenta cambiamenti minori.
]

==== Regole di incremento

#pad(left: 1em)[
- Ogni approvazione genera un incremento della cifra di versione stabile.  
- Nel versionamento X.Y.Z, maggiore è il cambiamento, più significativa è la cifra che viene incrementata: X ha un peso maggiore di Y, e Y maggiore di Z
- L’incremento di una cifra comporta sempre l’azzeramento delle cifre alla sua destra, mantenendo coerenza nella progressione delle versioni.
]
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


#insertArabicNumberedPagesSenzaData(PageTitle: "Best Practices", documentType: doc)[
= Best Practices
In questa sezione vengono riportate le best practices e pratiche standard concordate col gruppo al fine di garantire coerenza all'interno dei documenti.

== Formato nome dei verbali
Al fine di avere ordine estetico all'interno della repo, è stato deciso di adottare il seguente standard per la nomina dei verbali.
Di questi documenti interessa data e versione, dunque saranno nel formato: \
YYYY-MM-DD_Verbale-vX.Y.Z.typ

== Scrittura dei commit
#inserisciLink(url:"https://medium.com/@iambonitheuri/the-art-of-writing-meaningful-git-commit-messages-a56887a4cb49")[fonte interessante] \ // cambia il link
I commit dovrebbero avere un tipo ed una descrizione: il tipo indica qual è l'obbiettivo del commit, mentre la descrizione aiuta il lettore a comprendere meglio quali cambiamenti sono stati effettua. \ 
Le regole generali sono:
- iniziare il commit con tipo seguito da ":" .
- lasciare uno spazio tra tipo e descrizione.
- iniziare la descrizione con una lettera maiuscola.
- limitare la descrizione a massimo 50 caratteri.

Nel caso sia necessario modificare un commit (ad esempio in caso di errori) si utilizza il seguente comando #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit --amend`]
N.B. :  #upper("è") consigliato l'utilizzo del comando per modificare commit in locale prima di fare push nella repository condivisa. #upper("è") preferible astenersi dal modificare commit che sono già stati resi pubblici.

== Issue Template
]