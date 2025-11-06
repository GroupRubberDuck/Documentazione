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

#insertRomanNumberedPagesSenzaData(PageTitle: "Introduzione", documentType: doc)[
  = Introduzione
  In questo documento si tiene traccia e si definisce il way of working adottato dal gruppo. \

  Ogni documento è coerente con la versione del way of working definita fino a quel momento, attività antecedenti a una versione del way of working potrebbero non essere coerenti con la versione attuale.

  Questo way of working si applica alle attività che vanno dal #strong("23-10-2025") fino all'approvazione della successiva versione del Way of Working

  == Area per cui è stato stabilito un way of working:

  Attualmente il gruppo si è dato delle regole sulle attività relative ai seguenti ambiti:
  - *Area documentale*, quale documentazione produrre, come e chi la produce.
  - *Area del prodotto software*, suddivisione dei ruoli.
  - *Regolamento delle riunioni*, come si svolgono le riunioni.
]

#insertRomanNumberedPagesSenzaData(PageTitle: "Ambito documentale", documentType: doc)[
  = Area documentale
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

    == Rotazione e assegnazione dei ruoli
    Sono previsti 3 meccanismi di rotazione dei ruoli, ognuno di essi risponde a una specifica esigenza che il gruppo si è trovato ad affrontare durante lo svolgimento delle attività.
    - Documenti semplici
    - Documenti complessi
    - Situazioni di emergenza

    Di seguito essi vengono descritti nel dettaglio.
    === Documenti semplici
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
    
=== Documenti complessi
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

In caso si pongano in essere condizioni straordinarie che rendano necessaria una quanto più tempestiva risposta si possono ignorare i criteri sulla rotazione dei ruoli adottando un criterio molto grezzo:"Chi può fare per primo fa),ma mantenendo il vincolo di indipendenza  (Autore $eq.not$ Revisore $eq.not$ Verificatore) 


== Workflow 
All'interno dell'ambito documentale si è optato per il seguente modello per descrivere e modellare le attività necessarie a produrre un documento:
#image(images_dir+"/workflow.drawio.png" )


=== Stati del documento <Workflow>
  - *Backlog*, magazzino delle attività da svolgere, ogni documento inizia in questo stato.
  - *In progress*, il documento è stato preso in carico da un autore.
  - *In review* , il lavoro dell'autore è finito e il documento deve essere revisionato oppure il documento non è stato approvato nella fase "In validazione" e va corretto.
  - *In validazione*, il lavoro del revisore è finito e  il documento va valutato per l'approvazione o respinto fornendo le opportune motivazioni accompagnate da un elenco delle correzzioni da apportare.
  - *Done*, il documento è stato approvato

=== Procedura di avanzamento tra stati <Procedura_Workflow>
  - Da *Backlog* a *In Progress*: un autore si assegna una issue e comincia a scrivere la bozza del documento
  - Da *in progress* a *In review*: l'autore consegna la bozza in stato di revisione, deve portare la issue in revisione, togliersi dagli assegnatari e assegnarla al revisore (deciso a priori) che verrà notificato.
  - Da *In review* a *in validazione*: il revisore ha correto la bozza e propone una revisione al validatore. Deve portare la issue in validazione, togliersi dagli assegnatari e assegnarla al validatore.
  - Da *in validazione* a *in review*: il validatore rifiuta la revisione proposta allegando una lista di errori motivati che il revisore dovrà correggere. Dovrà riassegnare la issue al revisore.
  - Da *in validazione* a *done*: il validatore accetta la revisione proposta e chiude la issue con #block(
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
  Un repository GitHub dedicato per condividere il lavoro sia internamente che esternamente (Sfruttando la funzionalità github pages)

  tramite github action sono staste predisposte automazioni per la compilazione dei documenti .typ -> .pdf e per l'aggiornamneto del sito web


  Come Strumento per scrivere la documnetazione è stato scelto typst

  Tracciamento dei ruoli: si è deciso di tracciare i ruoli assegnati all'interno del documento stesso (nella tabella dello stato del documento e nel registro delle modifiche), in un foglio di calcolo dedicato per facilitare la rotazione dei ruoli e all'interno delle GitHub issue (dove non viene messo in evidenza il ruolo degli assegnatari ma solo il oro coinvolgimento)

  Per la modellazione del workflow sono stati usati i seguenti metodi.
  - A ogni documento viene fatto corrispondere un issue, tale issue viene inserito in una project board i cui stati rappresentano gli stati del workflow.
  - A ogni passaggio di stato, l'autore del cambiamento deve assicurarsi di spostare l'issue relativa al documento nella sezione appropriata
  - Per rappresentare il tipo di task, la priorità o altre informazioni rilevanti si sfruttano le funzionalità dell'issue tracking system offerto da GitHub

  Per realizzare la separazione tra area di rilascio e area di lavoro, come già detto si è deciso di sfruttare le funzionalità di braching offerte da GitHub e Git
]

= Stato dell'arte
== Scrittura dei commit
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

== Scrittura delle issue
Una issue deve essere composta da:
- Un titolo descrittivo
- Una descrizione dettagliata, con la consegna che lo sviluppatore deve rispettare
- Label:
    - contenuto: verbale interno, verbale esterno …
    - priorità: alta/media/bassa