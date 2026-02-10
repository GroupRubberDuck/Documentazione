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
  major:0,
  minor:0,
  patch:1,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 01, day:05)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "In verifica",
    versione: "0.0.1",
    autori: ("Felician Mario Necsulescu",),
    verificatori: ("Ana Maria Draghici",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[#giornoRiunione.display()],[Felician Mario Necsulescu],[Draghici Ana Maria],[Stesura del verbale]),
    ([1.0.0],[#giornoRiunione.display()],[Felician Mario Necsulescu],[Felician Mario Necsulescu],[Approvazione])
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
- *Motivazione*: Riunione post-vacanze
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione su Discord
- *Ora inizio*: 15:00;
- *Ora fine*: 16:40;
- *Scriba*: Felician Mario Necsulescu
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Filippo Guerra
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu  
- Aldo Bettega
- Davide Testolin
\
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  - Verifica stato dei documenti e aggiornamenti;
  - Sprint e pianificazione attività;
  - POC e scelte tecnologiche.

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[

  = Riassunto della riunione
  Durante la riunione abbiamo fatto il punto sullo stato del progetto, concentrandoci sulla Requirement Baseline e sulla Technology Baseline. Abbiamo esaminato in particolare l’avanzamento del piano di qualifica e delle metriche di qualità del processo, oltre a verificare lo stato generale dei documenti e a valutare le scelte architetturali per identificare il modello più adatto da implementare. Abbiamo quindi affrontato la struttura del Proof of Concept (POC), definendo le priorità tecnologiche e organizzative necessarie per garantire una presentazione coerente e completa all’RTB.
  
  == Architetture software

   Discussione sui criteri di scelta dell’architettura: manutenibilità, scalabilità, affidabilità, efficienza. Nel nostro caso riteniamo siano di priorità i parametri di manutenibilità e affidabilità.

   Analisi dei principali pattern architetturali:#pad(left: 1em)[

      - Layered / Monolitica (MVC): organizzazione in livelli (UI, business logic, gestione dati).

      - Microkernel: core centrale con plugin estensibili e indipendenti.

      - Microservizi: utile solo in casi complessi, probabilmente overkill per il progetto attuale.
  ]

   Preferenza del gruppo: MVC / Layered, per semplicità e familiarità con il pattern.

  == Piano di qualifica e metriche

  Per quanto riguarda il piano di qualifica, è stato chiarito che la parte di testing del prodotto non può ancora essere implementata, perché non ci sono ancora funzionalità da testare. Tuttavia, è possibile iniziare a monitorare la qualità del processo, concentrandosi su metriche come Earned Value, Actual Cost, Scheduled Performance Index, Cost Performance Index, Estimate at Completion e To Complete Performance Index.
  In aggiunta, alcuni processi organizzativi, come il Process Lead Time e il Task Completion on Time, possono essere già monitorati osservando quali task sono stati completati in ritardo. È stato sottolineato che tutte le metriche devono avere valori accettabili e ottimali, in modo da avere sia un obiettivo minimo sia un obiettivo ideale.
  
  == Sprint e pianificazione <sprint>

  Il team ha discusso la durata del prossimo sprint, concordando che uno sprint di quattro settimane, fino al 4 febbraio, sia la scelta più realistica. La pianificazione deve tenere conto degli esami dei membri del gruppo, che potrebbero ridurre le ore disponibili per lavorare sul progetto. Durante lo sprint, si prevede di completare le attività principali: portare l’analisi dei requisiti a uno stato presentabile a Cardin, aggiornare il piano di qualifica per quanto possibile, sistemare il piano di progetto e completare le norme di progetto.

  == Baseline del progetto

  È stata discussa l’importanza di avere una baseline ufficiale per il progetto, sia dei requisiti sia delle tecnologie. La Requirement Baseline (RB) servirà a mostrare i requisiti in uno stato accettabile e si prevede di completarla entro inizio febbraio, mentre la Technology Baseline (TB) raccoglierà tutte le scelte tecnologiche, i POC e la progettazione tecnologica, con completamento previsto per fine febbraio.

  == POC (Proof of Concept)

  Il Proof of Concept ha l’obiettivo di dimostrare che il team è in grado di integrare le tecnologie principali e gestire la comunicazione tra i vari moduli del progetto. In particolare, il POC permetterà di verificare la lettura e l’unificazione dei file di input, la comunicazione dal core logic alla view, la possibilità di modificare i file in modo dinamico e l’implementazione di logiche di decision tree.
  Sono stati discussi i principali strumenti tecnologici da integrare: FastAPI per il backend, React e React Flow per il frontend, sistemi di gestione degli eventi come Blinker per processi singoli e Kafka se sarà necessario gestire eventi concorrenti. È stato sottolineato che non è necessario testare la compatibilità di strumenti già nativamente integrati, come FastAPI e Pylant, mentre è fondamentale verificare l’integrazione tra componenti diverse e la gestione dei plugin.
]

#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni 
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.12."

#let decisioni=(
(

  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Avanzare con i vari documenti],
  [Si intende aggiornare e organizzare tutti i documenti di progetto in modo che siano in gran parte presentabili per l’RTB.],
  [@sprint]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO

#let prefisso="TD.15."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:

#let TODO=(

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Aggiornare il piano di qualifica con i cruscotti di valutazione.],
  [VI.12.1],
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Aldo Bettega],
  [Portare ad uno stato accettabile l'analisi dei requisiti.],
  [VI.12.1],
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Ana Maria Draghici],
  [Completare la sezione processi nel documento norme di progetto.],
  [VI.12.1],
),

  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]