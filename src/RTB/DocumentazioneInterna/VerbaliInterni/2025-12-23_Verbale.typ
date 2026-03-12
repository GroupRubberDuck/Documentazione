#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {set text(fill:blue); underline()[#body]}
#show ref: body => { underline()[#strong(body)]}

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


// 
//Info del documento 
// 
#let currentVersion=(
  major:1,
  minor:0,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2025, month: 12, day:23)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: "1.0.0",
    autori: ("Aldo Bettega",),
    verificatori: ("Felician Mario Necsulescu",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[#giornoRiunione.display()],[Aldo Bettega],[Felician Mario Necsulescu],[Stesura del verbale]),
    ([1.0.0], [2026-12-24], persone.ALDO, persone.ALDO, [Approvazione]),
      )

      #registroModifiche(modifiche)
]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Interno
- *Motivazione*: Riunione fine sprint
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:30
- *Ora fine*: 16:30
- *Scriba*: Aldo Bettega
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Filippo Guerra
- Davide Lorenzon
- Ana Maria Draghici 
- Aldo Bettega
- Davide Testolin
- Felician Mario Necsulescu
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Retrospettiva

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[

  = Riassunto della riunione
  La riunione di fine sprint ha riguardato principalmente:
  - Retrospettiva dello sprint
  - Aspetti tecnici della repo e del sito web (gestione cartelle e glossario)
  - Discussione sulle difficoltà incontrate nella progettazione del preventivo, data l'inesperienza dei membri del gruppo
  - Discussione su come avanzare verso il PoC e iniziare a studiare proposte di tecnologie per lo sviluppo del prodotto
  - Decisione condivisa di considerare il periodo di vacanze come pausa, senza rotazione dei ruoli e avanzamento dello sprint
  
  = Retrospettiva
  + Glossario web: aggiornamento dello script.
  + Use case: completati al 90%, raggiunta maturità di struttura e contenuti.
  + Requisiti: struttura generale definita, da concludere; Analisi dei requisiti quasi conclusa.
  + Piano di qualifica: prima stesura presente, inserita sezione sull'indice di Gulpease con appendice conclusiva.
  + Piano di progetto / preventivo: avviata ricerca sulle tecniche di stima, difficoltà causate dall'inesperienza che deve essere messa in considerazione e dichiarata.
  + Retrospettiva di sprint:
    - Cosa ha funzionato:
      - studio dei documenti condiviso tramite riassunti.
    - Proposte di miglioramento: 
      - ricerca a coppie su temi complessi;
      - migliore pianificazione basata sugli errori degli sprint precedenti;
      - esplicitare azioni concrete per gli sprint successivi.
  + Organizzazione e sprint: vacanze considerate come periodo di pausa, nessuna rotazione dei ruoli ed eventuale lavoro prodotto slitterà allo sprint successivo.


= Argomenti principali
== Glossario
Durante la riunione si è discusso dell’aggiornamento del glossario web e dello script Python utilizzato per la sua generazione. In particolare è emersa la necessità di estendere lo script esistente, già utilizzato in precedenza, per includere anche la gestione delle abbreviazioni. La modifica è stata ritenuta semplice e a basso impatto. Parallelamente si è affrontato il tema dell’organizzazione del repository e della struttura del sito web, valutando la possibilità di spostare tutti i file HTML all’interno della cartella docs, sfruttando le impostazioni offerte da GitHub Pages. È stato chiarito che questa soluzione permette di mantenere il repository più ordinato senza compromettere il funzionamento del sito. Si è quindi deciso di procedere con lo spostamento dei file del sito nella cartella docs e di adattare di conseguenza i path di input e output dello script di generazione del glossario, senza intervenire sui PDF salvo eventuali problemi futuri.

== Difficoltà nei preventivi
Una parte significativa della riunione è stata dedicata alle difficoltà incontrate nella definizione dei preventivi e delle stime temporali. È emerso che molte delle tecniche di preventivo analizzate si basano fortemente sull’esperienza pregressa e su dati storici, elementi che il gruppo non possiede in questa fase del progetto. Questo rende complessa l’applicazione rigorosa di tali tecniche e aumenta il rischio di effettuare stime basate esclusivamente su sensazioni soggettive. Si è quindi chiarito che l’inesperienza del team deve essere considerata e dichiarata esplicitamente all’interno della documentazione. Nonostante ciò, si è deciso di adottare comunque una tecnica di stima, anche se approssimativa, al fine di dimostrare un approccio metodologico consapevole. Inoltre, è stato sottolineato che la retrospettiva non deve limitarsi all’analisi di ciò che è andato bene o male, ma deve includere anche una revisione del piano futuro, con un ricalcolo delle ore e delle attività sulla base dell’esperienza maturata negli sprint precedenti, in linea con le indicazioni fornite dal docente.


== Scelte tecnologiche nel Piano di Qualifica
La discussione sulle scelte tecnologiche del Piano di Qualifica ha avuto carattere di brainstorming preliminare, senza portare a decisioni definitive. Sono state considerate in modo generale alcune possibili soluzioni, come un approccio web-based e l’uso del pattern Model–View–Controller, riconoscendo però la necessità di uno studio più approfondito per individuare le tecnologie più adatte al progetto.

Separatamente, si è discusso dell’indice di Gulpease, per il quale è stato deciso di definire chiaramente le modalità di applicazione. Il Piano di Qualifica includerà una sezione dedicata e un’appendice che ne descriva l’utilizzo concreto nel contesto del progetto, al fine di rendere il processo di valutazione esplicito e verificabile.


]

#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni 
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.11."

#let decisioni=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Aggiornamento dello script Python per la generazione del glossario web],
  [Necessità di includere le abbreviazioni e adattare i path dopo la riorganizzazione del sito],
  [Riunione fine sprint]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Spostamento dei file del sito web nella cartella `docs` del repository],
  [Migliorare l’ordine del repository sfruttando la configurazione di GitHub Pages],
  [Riunione fine sprint]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Trattare le scelte tecnologiche del PoC come brainstorming preliminare],
  [Mancanza di una valutazione approfondita delle tecnologie e necessità di studio ulteriore],
  [Riunione fine sprint]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Definire esplicitamente l’applicazione dell’indice di Gulpease nel Piano di Qualifica],
  [Rendere trasparente e verificabile l’uso delle metriche di leggibilità],
  [Riunione fine sprint]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Adottare una tecnica di preventivo dichiarando l’inesperienza del team],
  [Dimostrare un approccio metodologico pur in assenza di dati storici],
  [Riunione fine sprint]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]

#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO

#let prefisso="TD.14."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:

#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Aldo Bettega],
  [Stesura di questo verbale],
  [-]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Aggiornare lo script Python del glossario includendo abbreviazioni e nuovi path],
  [VI.11.1]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Spostare i file HTML del sito nella cartella `docs` e verificare il corretto funzionamento dei link],
  [VI.11.2]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Tutto il gruppo],
  [Studiare e valutare le tecnologie più adatte da adottare nel Piano di Qualifica],
  [VI.11.3]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Completare la sezione sull’indice di Gulpease e l’appendice applicativa],
  [VI.11.4]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Definire una tecnica di preventivo e aggiornare il piano nelle retrospettive future],
  [VI.11.5]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Da definire],
  [Iniziare a definire la struttura logica dei JSON per i decision tree],
  [Decisione su scelte tecnologiche PoC]
),
)


#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,auto,auto),)

]
