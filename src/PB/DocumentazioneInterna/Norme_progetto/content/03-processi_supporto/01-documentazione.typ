#import "/src/config.typ":images_dir
 
#set heading(numbering: "1.1)")
#set footnote.entry(
  separator: repeat[.],
  indent: 0em
)
== Introduzione ai processi di supporto <supporto>
I processi di supporto hanno lo scopo di garantire *l’efficace gestione, controllo e qualità delle attività del ciclo di vita del progetto*, fornendo strumenti, procedure e linee guida per supportare i processi primari (analisi, progettazione, sviluppo, verifica).

In conformità agli standard ISO di riferimento, i processi di supporto considerati nel presente documento includono:

+ *Documentazione*:\  Processo volto a registrare, organizzare e rendere disponibili tutte le informazioni prodotte durante il ciclo di vita del progetto, assicurando tracciabilità, trasparenza e coerenza dei contenuti.

+ *Gestione delle configurazioni*:\ Processo finalizzato a identificare, controllare, monitorare e aggiornare tutti gli elementi del progetto, garantendo la corretta gestione delle versioni e delle modifiche.

+ *Accertamento qualità*:\  Processo che comprende attività sistematiche di verifica volte a controllare che processi, documenti e prodotti intermedi siano conformi ai requisiti, agli standard e alle metriche di qualità definiti durante lo svolgimento del progetto.

+ *Processo di Qualifica*:\ Processo che comprende attività di verifica e validazione finalizzate a stabilire se un prodotto o deliverable può essere considerato concluso e idoneo al rilascio, garantendo la conformità alle specifiche tecniche e funzionali.

== *Processo di documentazione* <documentazione>
=== Introduzione
Il processo di documentazione definisce le *modalità con cui il team raccoglie, organizza e gestisce i documenti* prodotti durante il progetto. \ Fornisce un quadro chiaro dei *flussi documentali, delle responsabilità e degli strumenti utilizzati*, garantendo che le informazioni siano aggiornate, accessibili e coerenti con gli obiettivi del progetto.
=== Scopo del processo
Il processo di documentazione ha lo scopo di *registrare, organizzare e rendere disponibili tutte le informazioni* prodotte durante il ciclo di vita del progetto. \
Esso garantisce:
-  *Tracciabilità* delle decisioni;
-  *Coerenza* tra le attività svolte;
-  *Trasparenza* verso gli stakeholder e supporto del lavoro collaborativo del team.\
La documentazione prodotta costituisce un *riferimento chiaro e accessibile* per tutte le fasi del progetto, riducendo ambiguità e fraintendimenti.

=== Attività del processo 
==== Impegno del gruppo
Il gruppo si impegna a fornire alla proponente e ai docenti tutta la documentazione necessaria a supportare le attività di analisi, progettazione, sviluppo e verifica del progetto.
Tale documentazione ha lo scopo di garantire *trasparenza, tracciabilità e qualità del lavoro *svolto, oltre a costituire un *riferimento chiaro per tutti gli stakeholder* coinvolti.
==== Attività principali
Le principali attività che compongono questo processo sono:
#pad(left: 1em)[ 
+ *Identificazione dei documenti* \ Individuazione dei documenti necessari e definizione delle relative responsabilità.


+ *Progettazione dei documenti* \ Applicazione delle norme e del workflow stabilito.


+ *Pubblicazione e Distribuzione della Documentazione* \ Generazione del documento nel formato previsto e distribuzione ai destinatari autorizzati.

+ *Manutenzione* \ Aggiornamento continuo dei contenuti e gestione delle modifiche e delle revisioni.

+ *Archiviazione e tracciabilità* \ Gestione del versionamento, conservazione dei documenti e garanzia dell’accessibilità nel tempo.
]


=== Procedure operative

==== Identificazione dei documenti <identif>
  Si tratta di un'attività di pianificazione in cui ogni documento viene definito secondo le seguenti caratteristiche principali:

#pad(left: 1em)[
- Titolo;
- Scopo;
- Destinatari;
- Procedure e responsabilità nella redazione e gestione del documento;
- Pianificazione per le versioni e  i loro contenuti.
]

Per la redazione dei documenti è corretto e necessario fare riferimento a fonti autorevoli e aggiornate, quali standard ISO, università e organizzazioni ufficialmente riconosciute, materiale didattico e link di approfondimento forniti durante il corso. Eventuali informazioni provenienti da altre fonti, se ritenute utili, devono essere obbligatoriamente verificate per accertarne la correttezza e l'affidabilità.

==== Progettazione dei documenti
Ogni documento identificato all'interno dello sviluppo software deve rispettare alcuni standard di documentazione uguali per tutti: 
#pad(left: 1em)[
  - Essere in formato A4; 
  - I contenuti inseriti devono essere coerenti con lo scopo del documento stesso;
  - Tutti i documenti devono includere un indice dei contenuti e delle relative sottosezioni visibile all'inizio (ad eccezione del diario di bordo, che ne è esentato);
  - Ogni pagina deve contenere nel header e nel footer:
   1. La sezione corrente del documento (in alto a sinistra);
   2. Il nome del gruppo (in alto a destra);
   3. Il titolo del documento (in basso a sinistra);
   4. Il numero della pagina : espresso in numeri romani per la prefazione e in numeri arabi per le pagine del corpo del documento. 
]




==== Workflow documentale <workflow>
All'interno dell'ambito documentale si è optato per il seguente modello per descrivere e modellare le attività necessarie a produrre un documento:
#image(images_dir+"/workflow2.drawio.png" )

==== Stati del documento <Workflow>
  - *Backlog*: magazzino delle attività da svolgere, ogni documento inizia in questo stato.
  - *In lavorazione*: il documento è stato preso in carico dal componente del gruppo nel ruolo previsto.
  - *In verifica*: Il lavoro dell’autore è terminato. Il documento deve ora essere revisionato oppure corretto, nel caso in cui non sia stato approvato durante la fase di validazione.
  - *In approvazione*: il lavoro del revisore è finito. Il documento va valutato per l'approvazione oppure respinto, fornendo le opportune motivazioni accompagnate da un elenco delle correzioni da apportare.
  - *Done*: il documento è stato approvato.

==== Procedura di avanzamento tra stati <Procedura_Workflow>
  - Da *Backlog* a *In lavorazione*:  l'Amministratore crea la issue predisponendo l'ambiente tecnico; contestualmente, in accordo con il Responsabile, viene determinato e impostato l'assegnatario (componente del gruppo nel ruolo pertinente) che prende in carico l'attività.
  - Da *In lavorazione* a *In verifica*: l'assegnatario dichiara conclusa la propria attività, trasferendo la issue in revisione e assegnandola al Verificatore (deciso a priori) che verrà notificato automaticamente.
  - Da *In verifica* a *In lavorazione* (Rifiuto del Verificatore): il Verificatore rileva che non è conforme e riassegna la issue all'esecutore con un report delle anomalie da sanare.
  - Da *In verifica* a *In approvazione*: il Verificatore accerta la correttezza dell'incremento e sposta la issue in approvazione, assegnandola al Responsabile per il controllo finale di coerenza.
  - Da *In approvazione* a *In lavorazione* (Rifiuto del Responsabile): il Responsabile rileva incongruenze di alto livello o mancanze strategiche. La issue viene riassegnata all'assegnatario originale per la correzione, informando il Verificatore della svista.
  - Da *In approvazione* a *Done*: il Responsabile accetta la revisione proposta e chiude la issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`]

==== Procedura di archiviazione e tracciabilità
I documenti sono salvati sull'apposito repository.

Il path relativo è ricavabile nel seguente modo:
 \ (Fanno eccezione i diari di bordo, in quanto fanno parte delle regole di progetto, ma non supportano alcun processo primario, perciò sono salvati nella cartella *./src/DiariDiBordo*)

#align(center)[
*./\<Type\>/\<Baseline\>/\<Destinatari\>/\<Cartella del Documento\>*

]

#terms(separator:[: \ ], hanging-indent:2em,
  ([Type],[ - *src* per i file in formato typst. \
  - *output* per i pdf.
  ]),
  ([Baseline],[- *RTB* per i documenti allo stato della RTB. \
              - *PB* per i documenti allo stato della PB.]),
  ([Destinatari],[- DocumentazioneInterna per i documenti ad uso interno. \
                  - DocumentazioneEsterna per i documenti ad uso esterno.]),
  ([Cartella del Documento],[ 
    - VerbaliInterni.
    - VerbaliEsterni.
    - Per documenti complessi coincide con il nome del documento #footnote()[
      Per motivi di manutenibilità e facilità di aggiornamento i contenuti del file typst sono stati divisi in più file quando una loro sezione diventa eccessivamente corposa.
    ].
    ]),
)

==== Pubblicazione e Distribuzione della Documentazione
I documenti vengono ricompilati automaticamente in PDF tramite GitHub Action e sono consultabili da tutti i membri del team.
Sono disponibili nella repository del gruppo dedicata alla #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].
La posizione ufficiale dei file è indicata nel README.md del repository.  

Per facilitarne la consultazione è inoltre possibile accedere al  #link("https://grouprubberduck.github.io/Documentazione")[sito web ufficiale] del gruppo, creato appositamente per visualizzare e navigare i documenti in modo più immediato. 

La versione del documento e la tracciabilità delle modifiche sono gestite tramite il Registro delle Modifiche, integrato direttamente all’interno di ciascun documento.

=== Inquadramento del processo nelle Baseline di progetto

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


=== Documentazione fornita

==== Elenco dei documenti
#outline(title:none,target:figure.where(kind: "documenti"))
==== Informazioni comuni <informazioni_comuni>
Ogni documento presenta una sezione iniziale standardizzata per tutti i membri del team. 
Questa sezione viene generata utilizzando un apposito template centrale e unico, al fine di garantire coerenza e facilitare la compilazione. 

La sezione iniziale è composta dai seguenti elementi: 

*1. Pagina di copertina* : contenente il titolo del documento, il nome e il logo del gruppo e le relative informazioni di contatto.

*2. Tabella dello stato * : che riassume lo stato del documento e informazioni generali quali versione, autori, verificatori, uso e destinatari.

*3. Registro delle modifiche * : costituito da una tabella contenente le informazioni sul versionamento e sulla tracciabilità.

*4. Indice dei contenuti * : aggiornato automaticamente  tramite sintassi Typst.

*5. Indice delle immagini e delle tabelle* : presente solo nei documenti che ne contengono. 



==== Struttura specifica <struttura>
Di seguito viene riportata la struttura standard dei documenti principali, le rispettive sezioni, il loro scopo, i destinatari, e le metodologie adottate per la scrittura e la revisione, al fine di mantenere coerenza e uniformità all'interno del gruppo. 

\ 




#figure(kind:"documenti",supplement: "Documento", caption:"Analisi dei Requisiti")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Analisi dei Requisiti <requisiti>

  
#align(left)[

L’Analisi dei Requisiti ha il compito di descrivere in modo completo, chiaro e verificabile tutte le *funzionalità* che il sistema deve offrire, includendo sia *requisiti funzionali sia non funzionali*.  \
Il documento fornisce inoltre i principali *casi d’uso, con attori e scenari associati*, e garantisce la *tracciabilità tra requisiti*, casi d’uso ed eventuali *estensioni future*.  
Rappresenta un riferimento stabile per sviluppatori, tester e manutentori durante tutte le fasi del progetto.


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

#figure(kind:"documenti",supplement: "Documento", caption:"Piano di Qualifica ")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Piano di Qualifica 

#align(left)[


Il Piano di Qualifica ha l’obiettivo di garantire che il prodotto sviluppato rispetti elevati standard di qualità. Definisce processi, metriche, strategie di testing e criteri di valutazione necessari a verificare la qualità del software e del processo di sviluppo. Fornisce inoltre strumenti operativi per la misurazione e la validazione dei risultati.

*Destinatari*: stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)


===== Struttura principale

Il documento è articolato nelle seguenti componenti:
#pad(left: 1em)[

- Metriche di qualità del prodotto e del processo;

- Strategie, livelli e tecniche di testing;

- Piano delle verifiche e validazioni;

- Cruscotto qualità con indicatori e soglie di accettazione.
]
]

  ]
]


#figure(kind:"documenti",supplement: "Documento", caption:"Piano di Progetto")[
  #box(width: 120%,stroke:1pt,inset: 1em)[
    
==== Piano di Progetto

  
#align(left)[
Il Piano di Progetto definisce la pianificazione complessiva delle attività, descrivendo l’approccio  adottato dal gruppo. \  
Il documento fornisce una visione strutturata dell’*organizzazione del lavoro*, includendo la definizione degli obiettivi, la gestione delle risorse, l’assegnazione dei ruoli, la pianificazione temporale e l’analisi dei rischi. \ 
La sua funzione principale è garantire un monitoraggio costante dell’*avanzamento* del progetto attraverso *revisioni periodiche* e *rendicontazioni* relative ai vari sprint.  \
Tale monitoraggio consente al gruppo di valutare l’efficienza del workflow, individuare tempestivamente eventuali criticità e adattare la pianificazione quando necessario.

*Destinatari* : stakeholder interni ed esterni al progetto (BlueWind S.r.l., docenti e gruppo interno)

===== Struttura principale 

La struttura del documento comprende:
#pad(left: 1em)[

- Ambito e obiettivi del progetto;

- Analisi dei rischi e piani di mitigazione;

- Preventivo iniziale e disponibilità delle risorse;

- Pianificazione di lungo periodo;

- Sezione dedicata alle revisioni, che per ogni sprint comprende:
#pad(left: 1em)[

- *Attività pianificate* → obiettivi e task previsti per il periodo di sprint;

- *Gestione dei rischi* → analisi proattiva dei rischi attesi e dei rischi emersi, con indicazione delle relative strategie di mitigazione e piani di contingenza;

- *Preventivo ore per ruolo* → stima dell’effort pianificato, suddiviso per responsabilità;

- *Retrospettiva del gruppo* → riflessioni su apprendimento, workflow ed efficacia della collaborazione;

- *Consuntivo ore effettive* → rendicontazione delle ore realmente impiegate dal gruppo nello sprint per aggiornare il budget residuo.

]
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
]
Ogni verbale si conclude con una *riflessione finale del gruppo*, dalla quale emergono decisioni operative che vengono successivamente formalizzate tramite la creazione di *issue GitHub*, che il gruppo si impegna a completare. 

===== Struttura principale

Ogni verbale deve avere la seguente suddivisione numerata: 

  1. *Informazioni comuni della @informazioni_comuni* (standard condivisi di documento)
  2. *Informazioni generali*
      #pad(left: 1em)[
        - Data e luogo della riunione;
        - Orario di inizio/fine;
        - Partecipanti;
        - Tipologia (interno/esterno);
        - Motivo (principalmente per verbali esterni);
        - Scriba (responsabile del verbale in quel momento).
]
    3. *Ordine del giorno* :  scaletta dei temi da discutere, raccolti e organizzati del responsabile sulla base dei contributi dei membri del gruppo o dei referenti aziendali. 

    4. *Riassunto della riunione* :  sintesi breve e oggettiva dei punti discussi.

    5. *Decisioni * : azioni o obiettivi (anche ad alto livello) che il gruppo deve intraprendere per dare seguito alla riunione.
    6. *TODO* : attività specifiche derivate dalle decisioni.  Una singola decisione può essere suddivisa in più TODO, che complessivamente consentono di raggiungere l'obiettivo stabilito. 




]

  ]
]

#figure(kind:"documenti",supplement: "Documento", caption:"Diario di Bordo")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
====  Diario di Bordo

  
#align(left)[

Il Diario di Bordo è un’attività prevista dal Prof. Tullio Vardanega all’interno del progetto di Ingegneria del Software. Rappresenta un momento di condivisione in cui ciascun gruppo espone il proprio stato di avanzamento, con particolare attenzione a dubbi o problematiche emerse durante lo svolgimento delle attività.

Composto principalmente da: 
#pad(left: 1em)[
*Titolo*: Diario di Bordo seguito dal numero progressivo associato.

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
Le Norme di Progetto definiscono l'insieme di regole, convenzioni e standard adottati dal gruppo al fine di garantire coerenza, qualità e uniformità nella produzione della documentazione, del codice e dei deliverable. Il documento stabilisce inoltre procedure condivise per redazione, revisione, versionamento, gestione dei file e comunicazione interne, riducendo il rischio di errori, fraintendimenti o incoerenze operative tra i membri del team.

*Destinatari* : Tutti i membri del gruppo di progetto (interno)

===== Struttura principale  

Il documento delle Norme di Progetto è organizzato secondo i tipi di processo presenti nel progetto:

#pad(left: 1em)[
- *Processi primari*: attività direttamente legate alla realizzazione del prodotto software.  
- *Processi di supporto*: attività che garantiscono qualità, tracciabilità e gestione della documentazione.  
- *Processi organizzativi*: attività relative alla gestione del team, pianificazione e coordinamento.  

]




]

  ]
]


#figure(kind:"documenti",supplement: "Documento", caption:"Glossario")[
  #box(width: 100%,stroke:1pt,inset: 1em)[
    
==== Glossario
#align(left)[
Il Glossario ha l’obiettivo di garantire *chiarezza e uniformità nella terminologia* utilizzata nei documenti di progetto, sia verso l’esterno (proponente, docenti) sia all’interno del gruppo di lavoro.

Raccoglie i *termini ritenuti non banali, abbreviazioni e acronimi*, fornendo definizioni precise per ridurre ambiguità interpretative e favorire una comprensione condivisa dei concetti chiave.

Il documento è soggetto ad *aggiornamento continuo*, in modo da riflettere l’evoluzione del progetto e mantenere allineata la terminologia. Oltre alla versione ufficiale inclusa nei documenti di progetto, il team mantiene un glossario interno aggiornato disponibile sul sito web della documentazione, che funge da riferimento centralizzato sempre accessibile.

Per *favorire la tracciabilità e la consultazione immediata*, all’interno dei singoli documenti tutte le parole presenti nel glossario vengono evidenziate. Questa evidenziazione consente agli utenti di riconoscere rapidamente i termini definiti formalmente e di rimandare al glossario in caso di dubbi o possibili ambiguità.
]
  ]

]


 

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

*TurboScribe AI*: Per velocizzare il processo di documentazione, il gruppo utilizza il tool di intelligenza artificiale #link("https://turboscribe.ai/it")[TurboScribe], che consente di trascrivere registrazioni audio in formato testuale. 
Lo strumento è utilizzato in particolare per il supporto alla redazione dei verbali, permettendo il riascolto rapido di momenti specifici delle riunioni tramite selezione testuale.

