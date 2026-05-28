#import "@preview/cheq:0.3.0": checklist
== *Processo di Qualifica * <qualifica> 
=== Introduzione
Il processo di Qualifica coincide con l'insieme delle attività di Verifica e Validazione pianificate nel progetto. Il suo scopo è dimostrare, tramite evidenze oggettive e misurabili, che il prodotto sia conforme alle specifiche software (Verifica) e alle attese dell'utente (Validazione).
In termini operativi, la Qualifica non è solo una fase finale, ma un processo continuo regolato dal Piano di Qualifica, che definisce gli obiettivi quantitativi, e monitorato attraverso un cruscotto di valutazione.

=== Scopo del processo

- Assicurare la *conformità dei prodotti* alle specifiche tecniche e funzionali.

- *Ridurre errori e incoerenze* attraverso attività di verifica e validazione.

- Documentare in modo chiaro l’esito delle *attività di verifica e validazione*.

- Definire criteri oggettivi di completamento tramite la *Definition of Done (DoD)*.

=== Attività del processo
Le attività principali del processo di Qualifica comprendono:

- *Revisione finale dei deliverable* rispetto ai requisiti e agli standard;

- *Validazione* dei documenti e dei prodotti software;

- *Verifica del soddisfacimento* dei criteri di completamento;

- *Approvazione finale* dei deliverable qualificati.

==== Analisi statica 
L'analisi statica è una tecnica di verifica applicata senza eseguire il codice o il prodotto. Il suo scopo è individuare problemi di sintassi, logica o conformità agli standard prima che si manifestino durante l'esecuzione.

Il gruppo adotta due metodi di lettura a seconda del contesto:

- *Walkthrough*: revisione libera e approfondita dell'intero artefatto, condotta senza una lista di controllo predefinita. Parte dall'ipotesi che esista un difetto, ma senza conoscerne la natura o la posizione. È indicata per revisioni critiche o per artefatti nuovi, dove non è ancora disponibile esperienza pregressa sugli errori tipici. A causa dell'elevato costo in termini di tempo e risorse, viene applicata selettivamente, ad esempio in occasione delle revisioni RTB e PB o per la prima stesura di documenti strutturali.

- *Ispezione*: verifica guidata da una checklist predefinita, focalizzata su errori ricorrenti e criteri di qualità specifici. È meno approfondita del walkthrough, ma facilmente automatizzabile e ripetibile. Viene adottata come metodo principale per la verifica sistematica di documenti e codice, in particolare per verbali, analisi dei requisiti e sezioni già consolidate. Un esempio di checklist adottata è la @DOD (DOD).

===== Checklist di ispezione

La checklist utilizzata dal gruppo copre i seguenti aspetti:

- *Documenti*: ortografia e grammatica, rispetto del template, presenza e correttezza del registro delle modifiche, coerenza dei riferimenti interni, nomenclatura conforme alle Norme di Progetto.
- *Codice*: rispetto delle convenzioni di nomenclatura, assenza di codice morto o commentato, presenza di commenti significativi, gestione degli errori, conformità alle linee guida del linguaggio adottato.

===== Quando usare quale metodo
#figure(caption:"Metodologie di testing")[
#set align(left)

#table(
  columns: (auto, 1fr, 1fr),
  inset: 6pt,
  stroke: luma(210),
  [*Contesto*], [*Metodo*], [*Motivazione*],
  [Prima stesura di un documento critico], [Walkthrough], [Nessuna checklist disponibile, alto rischio di errori strutturali],
  [Verifica verbali e documenti ricorrenti], [Ispezione], [Formato standardizzato, errori prevedibili],
  [Revisione del codice in pull request], [Ispezione], [Automatizzabile, ripetibile, integrata nel workflow Git],
  [Revisione pre-RTB / pre-PB], [Walkthrough], [Qualità critica, revisione completa necessaria],
)

]
==== Analisi dinamica

L'analisi dinamica verifica il software eseguendolo con test specifici, al fine di misurarne la qualità funzionale e individuare errori nel comportamento a runtime. Ogni test è definito da uno stato iniziale, un insieme di input e gli output attesi, e deve produrre risultati riproducibili indipendentemente da chi lo esegue o quando.

I test devono essere ripetibili e automatizzabili, così da poter essere eseguiti in modo continuo durante l'intero ciclo di vita del prodotto, in particolare ad ogni modifica rilevante del codice.

==== Classificazione dei test

Tutti i test pianificati, eseguiti e i loro esiti sono tracciati nel Piano di Qualifica. I test sono classificati in categorie gerarchiche, ciascuna identificata da un codice univoco nel formato:

#align(center)[
  #block(inset: (x: 12pt, y: 8pt), stroke: luma(210), radius: 4pt)[
    #text(style: "italic")[TipoTest\_XX]
  ]
]

dove *TipoTest* indica la categoria e *XX* è un numero progressivo che identifica univocamente il test all'interno di essa.

Le categorie previste sono:
#figure(caption:"Tipi di test")[
#set align(left)
#table(
  columns: (auto, 1fr),
  inset: 6pt,
  stroke: luma(210),
  [*Codice*], [*Descrizione*],
  [TU], [Test di Unità — verifica il corretto funzionamento di una singola unità software in isolamento
  
  Divisi a loro volta in:
  - *TU-F*: per i test del frontend.
  - *TU-B*: per i test del backend.
  ],
  [TI], [Test di Integrazione — verifica l'interazione corretta tra più unità o componenti
  
  
  Divisi a loro volta in:
  - *TI-F*: per i test del frontend.
  - *TI-B*: per i test del backend.
  ],
  [TS], [Test di Sistema — verifica il comportamento del sistema nella sua interezza rispetto ai requisiti],
  [TA], [Test di Accettazione — verifica che il prodotto soddisfi i criteri concordati con il committente],
)
]

===== Stati dei test

Per consentire un monitoraggio efficace dell'avanzamento, ogni test assume uno dei seguenti stati:
#figure(caption: "Stati dei test")[


#table(
  columns: (auto, 1fr),
  inset: 6pt,
  stroke: luma(210),
  [*Stato*], [*Descrizione*],
  [P],  [Passed — il test è stato eseguito e ha prodotto l'output atteso],
  [I],  [Implementato — il test è stato scritto ma non ancora eseguito],
  [NI], [Non Implementato — il test è pianificato ma non ancora realizzato],  
  [F], [Fallito — il test ha prodotto un risultato diverso da quello atteso],
)
]
===== Test di Unità

I test di unità rappresentano il livello di granularità più basso e verificano il corretto funzionamento delle singole unità software nella loro forma più elementare: funzioni, metodi o classi.

Si distinguono due approcci:

- *Test funzionali*: analizzano il comportamento dell'unità osservando esclusivamente input e output, senza considerare la logica interna di implementazione. Poiché non esaminano i percorsi di esecuzione interni, non sono sufficienti da soli a garantire la correttezza dell'unità e devono essere affiancati da test strutturali.

- *Test strutturali*: analizzano la logica interna del codice, verificandone i diversi percorsi di esecuzione e la relativa copertura. Consentono di individuare rami non raggiungibili, condizioni mal gestite o percorsi di errore non testati.

I due approcci sono complementari: i test funzionali verificano il contratto esterno dell'unità, quelli strutturali ne garantiscono la solidità interna.

===== Test di Integrazione

I test di integrazione verificano che le componenti del sistema, già testate singolarmente, interagiscano e comunichino correttamente tra loro. L'obiettivo è individuare errori che emergono solo dalla combinazione di moduli: incompatibilità di interfacce, gestione scorretta dei dati condivisi o comportamenti inattesi nelle sequenze di chiamata.

Il gruppo adotta uno dei due approcci seguenti a seconda della struttura del componente da integrare:
#figure(caption: "Tipi di test d integrazione")[


#table(
  columns: (auto, 1fr, 1fr),
  inset: 6pt,
  stroke: luma(210),
  [*Approccio*], [*Descrizione*], [*Quando usarlo*],
  [Top-Down],
  [Si parte dalle componenti di livello superiore, utilizzando stub per simulare quelle non ancora integrate],
  [Quando la logica di controllo ad alto livello è prioritaria o le componenti di base non sono ancora disponibili],
  [Bottom-Up],
  [Si parte dalle componenti di base, utilizzando driver per simulare le chiamate dei livelli superiori],
  [Quando le componenti fondamentali sono stabili e si vuole verificarne il comportamento prima di procedere verso l'alto],
)
]
===== Test di Sistema

I Test di Sistema verificano il comportamento del sistema nella sua interezza, valutandone la conformità rispetto ai requisiti funzionali e non funzionali definiti nel documento di Analisi dei Requisiti. Consentono di validare aspetti quali la correttezza funzionale, l'affidabilità, la robustezza e la gestione degli errori in condizioni reali o simulate di utilizzo.

===== Test di Accettazione

I Test di Accettazione verificano che il sistema soddisfi le aspettative e i requisiti richiesti dalla proponente BlueWind Srl. Vengono eseguiti al termine del ciclo di sviluppo e coinvolgono direttamente la proponente nella valutazione del prodotto consegnato. Il loro esito positivo costituisce condizione necessaria per la validazione finale.


===== Test di Regressione

I Test di Regressione verificano che le modifiche apportate al sistema — siano esse correzioni di difetti o aggiunta di nuove funzionalità — non abbiano compromesso comportamenti precedentemente testati e corretti.

In tal caso il processo da seguire è:

+ Analizzare il problema e identificarne la causa;
+ Sviluppare e codificare la soluzione;
+ Rieseguire il test fallito per verificare che il problema sia stato risolto;
+ Rieseguire *l'intera suite di test* per assicurarsi che la correzione non abbia introdotto regressioni.

Quest'ultimo punto è fondamentale: una modifica apparentemente localizzata può avere effetti inattesi su funzionalità già verificate. Per questo motivo non ci si limita al solo test fallito, ma si rieseguono tutti i test disponibili.


==== Validazione

Il processo di Validazione ha lo scopo di accertare che quanto realizzato soddisfi le esigenze di BlueWind Srl. Si distingue dalla verifica per il suo focus sul risultato finale: mentre la verifica accerta che il prodotto sia costruito correttamente (_"Are we building the system right?"_), la validazione accerta che sia stato costruito il prodotto corretto (_"Are we building the right system?"_).
Dunque, pur avendo responsabilità diverse, la verifica prepara il successo della validazione. Sebbene la verifica si applichi ai singoli prodotti intermedi e la validazione al sistema nel suo complesso, la prima fornisce il supporto e l'evidenza oggettiva necessari per sostenere la successiva conclusione che il software sia validato e pienamente conforme alle attese del committente.


===== Attività di validazione

La Validazione si basa sull'analisi degli esiti dei test di accettazione e sul tracciamento dei requisiti definiti in accordo con BlueWind Srl. L'obiettivo è confermare che ogni requisito obbligatorio sia implementato e che il sistema si comporti correttamente in relazione a ciascuno di essi.


==== Definition of Done <DOD>

La *Definition of Done (DoD)* è un elemento molto importante nello sviluppo software, perché definisce le azioni che devono essere completate affinché i requisiti — espressi tramite un *Product Backlog Item (PBI)* — siano considerati conclusi. \
I criteri che la compongono devono essere concreti, verificabili e di dimensione ridotta, e hanno l’obiettivo di garantire un livello minimo di qualità per ogni rilascio o incremento del prodotto.

La seguente *Definition of Done* non sono statiche, ma dinamiche: evolvono in base alle esigenze del team di sviluppo.
===== Definition of Done - Ambito documentale
Di seguito viene riportata la Definition of Done per ogni prodotto documentale:

#show: checklist.with(marker-map: (" ": sym.ballot, "x": sym.ballot.cross, "-": sym.bar.h, "/": sym.slash.double))

- [ ] Controllare a livello semantico e grammaticale che tutto sia corretto (grammatica, punteggiatura, sintassi, rivedere frasi ripetute/ mal espresse);

- [ ] Controllare di aver incluso tutte le sezioni definite del WoW nel documento su cui si lavora; 

- [ ] Controllare di aver aggiornato nella tabella riepilogativa dello stato del documento: 
  - stato;
  - versione;
  - ruoli.
- [ ] Controllare di aver aggiunto le ultime modifiche anche sulla “tabella delle modifiche del documento”;

- [ ] *Nei verbali*, controllare che tutte le decisioni corrispondano a issue specifiche nell'issue template;

- [ ] L'avvenuto completamento della attività documentale deve essere sancito tramite un commit di chiusura che referenzi la issue corrispondente con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`] Verificare poi effettivamente la chiusura nel Projects Board.

Una volta verificati tutti i criteri precedenti, il Responsabile approva il lavoro svolto spostando le relative issue nello stato di 'Done'. Solo quando tutti i PBI previsti per lo Sprint risultano completati, il Responsabile autorizza il merge del branch develop nel branch main.
===== Definition of Done - Ambito codice
Di seguito viene riportata la Definition of Done per le attività di sviluppo del codice sorgente:

#show: checklist.with(marker-map: (" ": sym.ballot, "x": sym.ballot.cross, "-": sym.bar.h, "/": sym.slash.double))

    - [ ] Controllare che l'implementazione rispetti i requisiti definiti e l'architettura stabilita nella fase di progettazione iniziale;

    - [ ] Verificare che, in caso di modifiche architetturali o logiche avvenute durante la codifica, la relativa documentazione di progetto sia stata aggiornata di conseguenza;

    - [ ] Controllare che il codice rispetti le norme di codifica e le convenzioni di stile adottate dal team;


    - [ ] Controllare che i test (unitari e/o di integrazione) siano stati scritti, eseguiti e superati con successo per le funzionalità implementate, in caso contrario il verificatore dovrà integrarli;

    - [ ] Verificare la correttezza del codice tramite gli appositi tool e verificare il superamento dei test relativi alla continuos integration;

    - [ ] Controllare che il codice sia stato sottoposto a Code Review tramite l'apertura di una Pull Request (PR) e approvato da almeno un altro membro del team;

    - [ ] L'avvenuto completamento della attività di sviluppo deve essere sancito tramite un commit di chiusura che referenzi la issue corrispondente con #block(
    fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
    stroke: 1pt + black, // Bordo nero da 1 punto
    inset: 10pt          // Padding interno di 10 punti
    )[`git commit -m "commento. Close #numero_issue"`] Verificare poi effettivamente la chiusura nel Projects Board.

Al termine dello sprint il responsabile autorizza la pubblicazione delle funzionalità che soddisfano i criteri precedentemente definiti e procede alla pubblicazione sul branch main.




=== Strumenti a supporto

- *Typst* → gestione dei documenti, versionamento e inserimento automatico di metadati.

- *GitHub* → repository condiviso, issue tracking e tracciamento delle modifiche.

- *Automazioni* → script e workflow per calcolare metriche di qualità, generare report automatici, notificare approvazioni.

=== Documentazione a supporto

I processi di verifica e validazione si appoggiano ai seguenti documenti:

- *Analisi dei Requisiti*: definisce i requisiti funzionali e non funzionali concordati con BlueWind Srl. Costituisce la base di riferimento per la progettazione dei test di sistema e di accettazione, e per il tracciamento della copertura dei requisiti.
#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti-v1.0.0.pdf")[Riferimento all'Analisi dei Requisiti.]

- *Piano di Qualifica*: raccoglie le metriche di qualità adottate, i test pianificati ed eseguiti e i loro esiti. È il documento operativo di riferimento per il monitoraggio dell'avanzamento delle attività di verifica.
#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica-v1.0.0.pdf")[Riferimento al Piano di Qualifica]

- *Piano di Progetto*: definisce la pianificazione temporale delle attività, incluse quelle di verifica. Consente di contestualizzare i risultati dei test rispetto agli sprint in cui sono stati eseguiti.
#link("https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto-v1.0.0.pdf")[Riferimento al Piano di Progetto.]  

- *Norme di Progetto*: definisce le modalità operative di verifica e validazione adottate dal gruppo, incluse le checklist di ispezione, la classificazione dei test e i criteri di accettazione.
#link("https://grouprubberduck.github.io/Documentazione/")[Riferimento alle Norme di Progetto.]  
- *Verbali esterni*: documentano le decisioni e i requisiti concordati con BlueWind Srl nel corso delle riunioni. Costituiscono riferimento per verificare la corrispondenza tra quanto richiesto e quanto implementato.
#link("https://grouprubberduck.github.io/Documentazione/")[Riferimento ai Verbali esterni]
