#import "/src/config.typ":he
=== Introduzione

Questo processo definisce, realizza e mantiene l’insieme delle infrastrutture e degli strumenti di supporto utilizzati dal team durante il ciclo di vita del progetto.

=== Scopo del processo
Esso ha lo scopo di garantire un ambiente di lavoro affidabile, coerente e condiviso, che consenta lo svolgimento efficace delle attività di pianificazione, sviluppo, verifica e gestione.
L’adozione e la manutenzione controllata degli strumenti assicurano disponibilità, aggiornamento continuo e conformità agli standard di progetto, riducendo il rischio di inefficienze operative e problemi organizzativi.
=== Attività del processo <attività-infrastruttura>
Questa sezione descrive le macro-attività del processo di infrastruttura, indipendentemente dagli strumenti specifici.

Il processo di infrastruttura comprende le seguenti attività principali:

+ *Implementazione del processo* \ Definizione e adozione degli strumenti necessari a supportare le attività del progetto, con particolare attenzione alla comunicazione, alla collaborazione e all’automazione.

+ *Creazione* \ Configurazione iniziale degli strumenti selezionati, predisposizione degli ambienti di lavoro e definizione delle strutture organizzative (repository, template, workflow).

+ *Manutenzione* \ Aggiornamento e gestione continua dell’infrastruttura al fine di garantirne affidabilità, coerenza e conformità agli standard di progetto.

Tutti i task relativi alle attività di creazione e manutenzione sono di competenza dell’*Amministratore*.

=== Procedure operative

==== Implementazione del processo
Per facilitare il lavoro del gruppo, in particolare la comunicazione asincrona e la collaborazione distribuita, sono stati adottati i seguenti strumenti:

*Discord* – Piattaforma di messaggistica e videoconferenza per riunioni interne da remoto.

*Zoom* – Piattaforma di videoconferenza per riunioni con la proponente BlueWind.

*WhatsApp* – Messaggistica istantanea per comunicazioni interne asincrone.

*Telegram* – Messaggistica asincrona per comunicazioni con la proponente.

*Typst* – Linguaggio di markup per la redazione dei documenti, con compilazione automatizzata tramite script.

*Tinymist Typst* – Estensione di Visual Studio Code per il supporto sintattico e la live preview.

*Script bash* – Automazioni eseguite tramite GitHub Actions.

*Git* – Sistema di versionamento distribuito per codice e documenti.

*GitHub* – Piattaforma cloud per repository, issue tracking, integrazione continua e hosting.

*Google Docs* – Editor collaborativo per attività di brainstorming asincrono.

*Google Sheets* – Fogli di calcolo per il tracciamento di dati e metriche.

*Google Drive* – Sistema di file sharing per materiali di progetto.

*Python* – Linguaggio di programmazione usato per gestire alcuni script di automazione.


#he(body:"Creazione",level:4)
In questa sezione viene descritto il processo di creazione e configurazione degli strumenti ritenuti significativi per il supporto alle attività di progetto.

#show figure: set block(breakable: true)
#figure(caption: "Strumenti utilizzati", kind:table)[
#show grid.cell.where(x:0):cell=>{strong(cell)}

#grid(
  grid.vline(x:1, stroke:(luma(20%))),
  columns: (auto, 0pt ,1fr),align: left, gutter: (2em,1em) ,
  [Typst],[],[
  L’ambiente di lavoro *Typst* è stato personalizzato per supportare in modo efficiente la redazione della documentazione.
  Typst consente la definizione di *template*, utilizzati in modo analogo alle chiamate di funzione di un linguaggio di programmazione.

  I template principali svolgono le seguenti funzioni:
  #terms(separator:[: \ ], hanging-indent: 0em ,spacing:1.5em,
    ([Impaginazione],[Impostazione uniforme di header e footer e definizione delle regole di stile comuni a tutti i documenti #footnote()[Ad esempio, i link non sono visualizzati in blu e sottolineati di default; tale regola stilistica viene ereditata automaticamente dal contenuto del documento.].]),
    ([Tabelle],[Predisposizione di template per la creazione semplificata di tabelle.]),
    ([Sprint],[Automazione del riepilogo degli sprint, comprensiva dei calcoli necessari e del layout dedicato.]),
    ([Marcatura automatica dei termini del Glossario],[Funzionalità attivabile tramite un apposito flag booleano; se lasciata sempre attiva può impattare negativamente le prestazioni della live preview.]),
    ([Separazione tra contenuto e layout del Glossario],[I termini e le definizioni del Glossario sono mantenuti in un file separato sotto forma di dizionario, consentendo l’ordinamento automatico e la generazione di viste personalizzate in formato PDF e HTML.]),
    ([Gestione automatica della numerazione <auto-numbering>],[#upper("è") stata implementata una gestione automatica della numerazione sia in fase di creazione sia in fase di referenziamento, anche tra documenti diversi. La referenziazione avviene tramite funzioni apposite che accettano in input una stringa rappresentante il nome che identifica l'elemento target. 
    
    Gli elementi finora sottoposti a tale numerazione automatica sono:
    - Casi d'uso;
    - Requisiti;
    - Test.
    ]),
    ([Tracciamento automatico<auto-tracker>],[Sono state predisposte apposite funzioni per la costruzione automatica delle seguenti tabelle di tracciamento:
    - Tracciamento casi d'uso - requisiti funzionali;
    - Tracciamento test di sistema - requisiti funzionali. 
    ]),
    ([Plot diagrammi dei casi d'uso<use-case-dia>],[#upper("è") stata predisposta una funzione per il plot dei diagrammi di attività in modo da poter applicare l'automazione già predisposta per la gestione del numbering.]),
  )
  ],


  [Git],[],[
L’intero progetto utilizza *Git* come sistema di versionamento. \
Sono stati definiti due branch principali:
- *Main*, destinato ai rilasci ufficiali;
- *Develop*, utilizzato per lo svolgimento delle attività di progetto.  
#upper("è") stato inoltre predisposto un file `.gitignore` per evitare la pubblicazione di file indesiderati. 
],
 [GitHub],[],[
#upper("è") stata creata una #link("https://github.com/GroupRubberDuck")[GitHub Organization (https://github.com/GroupRubberDuck)] dedicata alle attività di progetto e i seguenti repository:
-  #link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione https://github.com/GroupRubberDuck/Documentazione];
- #link("https://github.com/GroupRubberDuck/PoC")[Proof of Concept https://github.com/GroupRubberDuck/PoC]

#terms(
  separator:[: \ ], hanging-indent: 0em ,spacing:1.5em,
  ([GitHub Actions],[Sono state configurate delle GitHub Actions per la compilazione automatica dei file Typst e per l’aggiornamento automatico del sito web.]),
  ([GitHub Pages],[#upper("è") stata attivata la funzionalità *GitHub Pages* per l’hosting del sito web del progetto.]),
  ([GitHub Issue Tracking System],[Il gruppo ha deciso di avvalersi dell’issue tracking system offerto da GitHub; maggiori dettagli sono disponibili nella sezione dedicata alla guida operativa @issue-tracking.]),
)
],

[Strumenti di \ comunicazione],[],[
Nessuno degli strumenti di comunicazione ha richiesto operazioni significative durante la fase di creazione.
],

[Strumenti \ Google],[],[
#upper("è") stata creata una mail dedicata alle attività di progetto.
Google Drive e Google Docs non richiedono particolari operazioni di configurazione, se non il caricamento e la condivisione del materiale.
Google Sheets richiede invece operazioni più complesse per l’implementazione delle metriche e degli indicatori stabiliti.
],

[Script python <python>],[],[Insieme alla numerazione automatica realizzata tramite funzioni Typst è stato predisposto uno script python per mantenere ordinati e coerenti con la numerazione i file all'interno della cartella di lavoro. Inoltre crea eventuali file mancanti partendo da un template configurabile e aggiorna il file index usato per l'aggregazione dei singoli elementi.]
)

]

==== Manutenzione
Nel corso del progetto è necessario garantire il costante aggiornamento e il corretto funzionamento dell’infrastruttura e degli strumenti adottati.
Le attività di manutenzione hanno lo scopo di assicurare la continuità operativa, l’affidabilità e l’allineamento agli standard definiti.

Le operazioni di manutenzione possono essere classificate in base alla frequenza:

- *Manutenzione ordinaria*: aggiornamenti periodici e interventi ricorrenti legati alla normale evoluzione delle attività di progetto;
- *Manutenzione non ordinaria*: aggiunte, modifiche o rimozioni di strumenti, configurazioni o risorse rese necessarie da cambiamenti nei requisiti, criticità emerse o decisioni organizzative straordinarie. 


#he(body:"Project board", level:5)
Le issue vengono organizzate all’interno di una *Project Board* dedicata, che consente di avere una visione d’insieme sullo stato di avanzamento delle attività e di monitorare il carico di lavoro del team.

#he(body:"Milestone", level:5)
Le *milestone* rappresentano obiettivi intermedi fondamentali nella pianificazione di medio e lungo periodo.

L’assegnazione delle issue alle milestone è responsabilità dell’amministratore, che provvede inoltre al loro aggiornamento in caso di variazioni nella pianificazione o nelle priorità di progetto.


#he(body:"GitHub Actions", level:4)
Le *GitHub Actions* costituiscono il sistema di automazione adottato dal gruppo per supportare le attività ricorrenti del progetto, in particolare quelle legate alla compilazione e al rilascio della documentazione.

Le azioni sono definite tramite file di configurazione in formato *YAML* e sono memorizzate nella cartella #underline(".github/workflows") del repository.
La loro manutenzione e modifica rientra nelle responsabilità dell’amministratore di progetto.


#he(body:"Script e automazioni", level:4)
Il mantenimento degli script e delle automazioni è di competenza dell’*amministratore*.

Tali attività di manutenzione, siano esse ordinarie o straordinarie, si rendono necessarie nei seguenti scenari:
- *Evoluzione*: introduzione di nuove automazioni per supportare processi emergenti;
- *Ottimizzazione*: dismissione di procedure divenute obsolete o ridondanti;
- *Correzione*: risoluzione di malfunzionamenti o errori logici negli script esistenti.

Le automazioni strettamente legate alla redazione dei documenti in *Typst*, inclusi i template, sono salvate nella cartella #underline("src/TypstTemplate") all’interno del repository
#link("https://github.com/GroupRubberDuck/Documentazione")[Documentazione].

Gli script di uso generale, non direttamente collegati a Typst, sono invece salvati nella cartella #underline("scripts").


#he(body:"Discord", level:4)
Per quanto riguarda la piattaforma *Discord*, le attività operative rilevanti si limitano alla:
- Creazione di nuovi canali, qualora necessario;
- Moderazione di base per garantire ordine e chiarezza nelle comunicazioni interne.

Non sono previste configurazioni avanzate o attività di manutenzione complesse.


#he(body:"Strumenti Google", level:4)
Di seguito sono elencate le principali attività operative associate agli strumenti della suite Google utilizzati nel progetto.

#terms(separator: [: \ ],hanging-indent: 0em ,spacing:1.5em,
  ([Google Drive],[Gestione dello spazio condiviso, inclusa la creazione di nuove cartelle e l’eliminazione di file obsoleti.]),
  ([Google Docs],[Predisposizione, ove necessario, di layout coerenti per i documenti condivisi e di supporto alle attività di progetto.]),
  ([Google Sheets],[Implementazione e aggiornamento delle metriche stabilite, sfruttando le funzionalità offerte dai fogli di calcolo.]),
)
