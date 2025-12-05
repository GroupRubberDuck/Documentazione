#import "/src/config.typ":images_dir
 
#set heading(numbering: "1.1)")
#set footnote.entry(
  separator: repeat[.],
  indent: 0em
)

Il processo di documentazione ha lo scopo di registrare e rendere disponibili le informazioni prodotte dai processi primari del progetto.

Consente di tracciare con maggiore efficacia le decisioni adottate, ridurre il rischio di ambiguità, evitare fraintendimenti e facilitare l’organizzazione del *lavoro asincrono e collaborativo*.

Le principali attività che compongono questo processo sono:
#pad(left: 1em)[ 
+ *Identificazione dei documenti* #sym.arrow individuazione dei documenti necessari e ne riferisce 


+ *Progettazione dei documenti* → applicazione delle norme e del workflow stabilito;


+ *Pubblicazione e Distribuzione della Documentazione* → generazione del documento in formato destinato alla distribuzione;

+ *Manutenzione* → aggiornamento continuo del contenuto e gestione delle modifiche;

+ *Archiviazione e tracciabilità* → versionamento, conservazione e accessibilità nel tempo.
]
=== Impegno del gruppo nella produzione della documentazione

Il gruppo si impegna a fornire alla proponente e ai docenti tutta la documentazione necessaria a supportare le attività di analisi, progettazione, sviluppo e verifica del progetto.
Tale documentazione ha lo scopo di garantire trasparenza, tracciabilità e qualità del lavoro svolto, oltre a costituire un riferimento chiaro per tutti gli stakeholder coinvolti.

=== Workflow documentale
All'interno dell'ambito documentale è stato optato il seguente modello per descrivere e modellare le attività necessarie a produrre un documento:
#image(images_dir+"/workflow.drawio.png" )

==== Stati del documento <Workflow>
  - *Backlog*: magazzino delle attività da svolgere, ogni documento inizia in questo stato.
  - *In progress*: il documento è stato preso in carico da un autore.
  - *In review*: Il lavoro dell’autore è terminato. Il documento deve ora essere revisionato oppure corretto, nel caso in cui non sia stato approvato durante la fase di validazione.
  - *In validazione*, il lavoro del revisore è finito. Il documento va valutato per l'approvazione oppure respinto, fornendo le opportune motivazioni accompagnate da un elenco delle correzioni da apportare.
  - *Done*, il documento è stato approvato.

==== Procedura di avanzamento tra stati <Procedura_Workflow>
  - Da *Backlog* a *In Progress*: un autore si assegna una issue e inizia a scrivere la bozza del documento.
  - Da *In progress* a *In review*: l'autore consegna la bozza, trasferendo la issue in revisione e assegnandola al revisore (deciso a priori) che verrà notificato automaticamente.
  - Da *In review* a *In validazione*: il revisore ha apportato modifiche alla bozza e propone la revisione al validatore. Il revisore deve spostare la issue in validazione e assegnarla al validatore.
  - Da *In validazione* a *In review*: il validatore rifiuta la revisione proposta allegando una lista di modifiche motivate che il revisore dovrà apportare al documento. Il validatore dovrà riassegnare la issue al revisore.
  - Da *In validazione* a *Done*: il validatore accetta la revisione proposta e chiude la issue con #block(
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

*Github*: Strumento scelto dal gruppo per la condivisione del lavoro e la gestione delle attività tramite *issue tracking*.
#pad(left: 1em)[ 
- Utilizzo di GitHub Actions per la compilazione automatica dei documenti.
- Documentazione disponibile nel repository #link("https://github.com/GroupRubberDuck/Documentazione")[Github].
- #link("https://grouprubberduck.github.io/Documentazione")[Sito web] predisposto tramite GitHub Pages per facilitare la consultazione della documentazione.


]

*TurboScribe AI*: Per velocizzare il processo, il gruppo utilizza il tool AI #link("https://turboscribe.ai/it")[TurboScribe] che consente di trascrivere facilmente da registrazioni audio, utile per funzionalità come il riascolto di momenti specifici della riunione tramite selezione testuale.


=== Identificazione dei documenti <identif>
  Si tratta di una fase di pianificazione in cui ogni documento viene definito secondo le seguenti caratteristiche principali:

#pad(left: 1em)[
- Titolo;
- Scopo;
- Destinatari;
- Procedure e responsabilità nella redazione e gestione del documento;
//DUBBIO
- Pianificazione per le versioni e  i loro contenuti.
]
==== Elenco dei documenti
#outline(title:none,target:figure.where(kind: "documenti"))


=== Progettazione dei documenti
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


=== Pubblicazione e Distribuzione della Documentazione
I documenti vengono ricompilati automaticamente in PDF tramite GitHub Action e sono consultabili da tutti i membri del team.
Sono disponibili nella repository del gruppo dedicata alla #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].
La posizione ufficiale dei file è indicata nel README.md del repository.  

Per facilitarne la consultazione è inoltre possibile accedere al  #link("https://grouprubberduck.github.io/Documentazione")[sito web ufficiale] del gruppo, creato appositamente per visualizzare e navigare i documenti in modo più immediato. 

La versione del documento e la tracciabilità delle modifiche sono gestite tramite il Registro delle Modifiche, integrato direttamente all’interno di ciascun documento.
=== Posizione del Documento
I documenti sono salvati sull'apposito repository.

Il path relativo è ricavabile nel seguente modo:
 \ (Fanno eccezione i diari di bordo, in quanto fanno parte delle regole di progetto, ma non fanno supporto ad alcun processo primario, perciò sono salvati nella cartella *./\<Type\>src/DiariDiBordo*)

#align(center)[
*./\<Type\>/\<Milestone\>/\<Destinatari\>/\<Cartella del Documento\>*

]

#terms(separator:[: \ ], hanging-indent:2em,
  ([Type],[ - *src* per i file in formato typst. \
  - *output* per i pdf.
  ]),
  ([Milestone],[- *RTB* per i documenti allo stato della RTB. \
                - *PB* per i documenti allo stato della PB.]),
  ([Destinatari],[- DocumentazioneInterna per i documenti ad uso interno. \
                  - DocumentazioneEsterna per i documenti ad uso esterno.]),
  ([Cartella del Documento],[ 
    - VerbaliInterni
    - VerbaliEsterni
    - Per documenti complessi coincide con il nome del documento #footnote()[
      Per motivi di manutenibilità e facilità di aggiornamento i contenuti del file sono stati divisi in più file quando una loro sezione diventa eccessivamente corposa.
    ]
    ]),
)


=== Informazioni comuni <informazioni_comuni>
Ogni documento presenta una sezione iniziale standardizzata per tutti i membri del team. 
Questa sezione viene generata utilizzando un apposito template centrale e unico, al fine di garantire coerenza e facilitare la compilazione. 

La sezione iniziale è composta dai seguenti elementi: 
#pad(left: 1em)[
*1. Pagina di copertina* contenente il titolo del documento, il nome e il logo del gruppo e le relative informazioni di contatto.

*2. Tabella dello stato * che riassume lo stato del documento e informazioni generali quali versione, autori, verificatori, uso e destinatari.

*3. Registro delle modifiche * costituito da una tabella contenente le informazioni sul versionamento e sulla tracciabilità.

*4. Indice dei contenuti * aggiornato automaticamente  tramite sintassi Typst.

*5. Indice delle immagini e delle tabelle* presente solo nei documenti che ne contengono. 
]



=== Documentazione prevista per la fase RTB

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



=== Struttura specifica dei documenti 

Di seguito viene riportata la struttura standard dei documenti principali, le rispettive sezioni, il loro scopo, i destinatari, e le metodologie adottate per la scrittura e la revisione, al fine di mantenere coerenza e uniformità all'interno del gruppo. 

#figure(kind:"documenti",supplement: "Documento", caption:"Analisi dei Requisiti")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Analisi dei Requisiti

  
#align(left)[

L’Analisi dei Requisiti ha il compito di descrivere in modo completo, chiaro e verificabile tutte le funzionalità che il sistema deve offrire, includendo sia requisiti funzionali sia non funzionali. Il documento fornisce inoltre i principali casi d’uso, con attori e scenari associati, e garantisce la tracciabilità tra requisiti, casi d’uso ed eventuali estensioni future. Rappresenta un riferimento stabile per sviluppatori, tester e manutentori durante tutte le fasi del progetto.


*Destinatari* : stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)
===== Struttura principale 
Il documento comprende:
#pad(left: 1em)[
- Definizione formale dei requisiti funzionali e non funzionali;

- Modellazione dei casi d’uso con attori e flussi narrativi;

- Matrice di tracciabilità requisiti–casi d’uso;

- Eventuali vincoli tecnici, operativi o di contesto.

]
]

  ]
]


#figure(kind:"documenti",supplement: "Documento", caption:"Piano di Progetto")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Piano di Progetto

  
#align(left)[
Il Piano di Progetto definisce la pianificazione complessiva del lavoro, descrivendo l’approccio plan–driven adottato dal gruppo. Documenta obiettivi, risorse, ruoli, tempistiche e rischi, fornendo una visione strutturata dell’organizzazione del progetto. Ha inoltre lo scopo di monitorare l’avanzamento attraverso revisioni periodiche e rendicontazioni per sprint.

*Destinatari* : stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)

===== Struttura principale 

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
]

]

  ]
]

#figure(kind:"documenti",supplement: "Documento", caption:"Piano di Qualifica ")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Piano di Qualifica 

#align(left)[


Il piano di qualifica ha l’obiettivo di garantire che il prodotto sviluppato rispetti elevati standard di qualità. Definisce processi, metriche, strategie di testing e criteri di valutazione necessari a verificare la qualità del software e del processo di sviluppo. Fornisce inoltre strumenti operativi per la misurazione e la validazione dei risultati.

*Destinatari*: stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)


===== Struttura principale

Il documento è articolato nelle seguenti componenti:
#pad(left: 1em)[

- Metriche di qualità del prodotto e del processo;

- Strategie, livelli e tecniche di testing;

- Piano delle verifiche e validazioni;

- Cruscotto qualità con indicatori e soglie di accettazione;
]
]

  ]
]

#figure(kind:"documenti",supplement: "Documento", caption:"Verbali")[
  #box(width: 120%,stroke:1pt,inset: 1em )[
    
==== Verbali

  
#align(left)[

I verbali sono suddivisi in due categorie principali : 
#pad(left: 1em)[
- Verbali interni -> documentano riflessioni e confronti avvenuti esclusivamente tra i membri del gruppo.
- Verbali esterni -> vengono redatti in corrispondenza di riunioni o confronti con l'azienda di riferimento (Bluewind).

Ogni verbale si conclude con una *riflessione finale del gruppo*, dalla quale emergono decisioni operative che vengono successivamente formalizzate tramite la creazione di *issue GitHub*, che il gruppo si impegna a completare. 
]

===== Procedure e responsabilità
Il verbale deve essere un riassunto chiaro e oggettivo della riunione. 
Per velocizzare il processo, il gruppo utilizza il tool AI #link("https://turboscribe.ai/it")[TurboScribe].

===== Struttura Verbale

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


]

  ]
]

#figure(kind:"documenti",supplement: "Documento", caption:"Diario di Bordo")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
====  Diario di Bordo

  
#align(left)[

Il Diario di bordo è un’attività prevista dal Prof. Tullio Vardanega all’interno del progetto di Ingegneria del Software. Rappresenta un momento di condivisione in cui ciascun gruppo espone il proprio stato di avanzamento, con particolare attenzione a dubbi o problematiche emerse durante lo svolgimento delle attività.

Composto principalmente da: 
#pad(left: 1em)[
*Titolo*: Diario di bordo seguito dal numero progressivo associato.

*Scopo*: Fornire ai gruppi un feedback sulle attività svolte e consentire di portare all’attenzione comune eventuali dubbi relativi al processo di lavoro.

*Destinatari*: Prof. Tullio Vardanega e gli altri gruppi coinvolti nel progetto.
]

]

  ]
]


#figure(kind:"documenti",supplement: "Documento", caption:"Norme di Progetto")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Norme di Progetto 

  
#align(left)[
Le Norme di Progetto hanno l’obiettivo di definire regole, convenzioni e standard condivisi all’interno del gruppo, al fine di garantire coerenza, qualità e uniformità nella produzione di documenti, codice e deliverable.  
Esse servono a stabilire procedure comuni per redazione, revisione, versionamento, gestione dei file e comunicazione interna, riducendo il rischio di errori, ambiguità o incongruenze tra i membri del team.

*Destinatari* : Tutti i membri del gruppo di progetto

===== Struttura principale  
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

  ]
]


#figure(kind:"documenti",supplement: "Documento", caption:"Glossario")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Glossario
Il glossario ha l'obiettivo di disambiguare le comunicazioni con l'esterno e tra i membri del gruppo.

Contiene l'elenco dei termini ritenuti non banali, le abbreviazioni o acronimi, e le loro definizioni.

il documento è sottoposto ad aggiornamento continuo.

  
#align(left)[


]

  ]
]


#figure(kind:"documenti",supplement: "Documento", caption:"")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== 

  
#align(left)[


]

  ]
]







=== Manutenzione 


