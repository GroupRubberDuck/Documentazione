#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {
  set text(fill: blue)
  underline()[#body]
}
#show ref: body => { underline()[#strong(body)] }

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


#let giornoRiunione = datetime(year: 2026, month: 04, day: 09)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: "1.0.0",
    autori: (persone.FILIPPO,),
    verificatori: (persone.DL,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Indice", "Verbale interno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale interno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Interno
  - *Motivazione*: Riunione
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 15.00
  - *Ora fine*: 16.15
  - *Scriba*: #persone.FILIPPO
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      - Ana Maria Draghici
      - Davide Lorenzon
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Retrospettiva dello Sprint 9.
  - Aggiornamento sullo stato della Specifica Tecnica (ST).
  - Definizione dei ruoli e assegnazione dei task per lo Sprint 10.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione
  La riunione è iniziata con la retrospettiva dello Sprint 9, durante la quale ciascun membro ha rendicontato le attività svolte e le relative ore per ruolo. Il team ha poi discusso l'avanzamento del documento di Specifica Tecnica, con particolare attenzione all'architettura esagonale, ai diagrammi di sequenza e alla struttura del diagramma delle classi. Sono state prese decisioni tecniche riguardo all'utilizzo di PlantUML come strumento per la generazione di diagrammi UML e alla notazione da adottare (UML 2.0). Infine, il gruppo ha definito i ruoli per lo Sprint 10 e programmato una mini-riunione di allineamento di metà sprint.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Specifica Tecnica <st>

  == Diagrammi di Sequenza
  È stata presentata la bozza dei diagrammi di sequenza realizzati tramite PlantUML (software usato al posto di draw.io). L'utilizzo di PlantUML ha consentito di ridurre notevolmente i tempi di produzione, perciò il team ha deciso di usare PlantUML anche per i futuri diagrammi delle classi. È stato precisato che i diagrammi di sequenza devono contenere i nomi reali delle funzioni che verranno implementate; eventuali discrepanze emerse durante la codifica verranno corrette per mantenere la coerenza tra documentazione e codice.

  == Diagrammi delle Classi 
  Il team ha deciso di adottare la notazione UML 2.0 per la rappresentazione delle interfacce nei diagrammi delle classi, utilizzando la rappresentazione a cerchio (lollipop). È stata verificata la compatibilità di PlantUML con tale notazione.
  Per quanto riguarda la struttura del diagramma delle classi, il team ha optato per una suddivisione per package anziché per un unico grande diagramma, al fine di migliorare leggibilità e manutenibilità. Ogni package conterrà il proprio diagramma delle classi; i file PlantUML potranno essere organizzati in una cartella dedicata all'interno del repository, così da essere sotto controllo di versione e importabili nella Specifica Tecnica.

  == Persistenza dei dati (Mongo DB)
  È stata presentata la necessità di descrivere nella ST la struttura di persistenza su MongoDB. Il modello dei dati prevede una struttura ad albero: il nodo radice rappresenta i dati anagrafici del dispositivo, i nodi figli sono gli asset, e i nodi foglia sono i requisiti definiti dal modello. MongoDB salva i dati in formato JSON, che supporta nativamente questa struttura. Il team ha discusso la possibilità di definire vincoli di schema per le parti fisse del modello (es. nome e sistema operativo del dispositivo) lasciando flessibilità per le parti variabili (asset e requisiti).

  == Design Pattern e Architettura <ds>
   È stato chiarito che le classi all'interno di un modulo non devono comunicare direttamente con classi di moduli diversi, ma sempre tramite porte e adattatori, in accordo con i principi dell'architettura esagonale. Il team ha concordato di procedere con una bozza dei design pattern, consapevole che le scelte potranno essere riviste durante la fase di codifica.

  = Pianificazione Sprint 10  <sprint>
  Lo Sprint 10 è stato definito dal 14 aprile al 20 aprile 2026. La riunione di chiusura sprint è stata fissata per lunedì 20 aprile alle ore 15.00. I ruoli assegnati per lo sprint sono i seguenti:

    - Responsabile: Davide Testolin.
    - Amministratore: Felician Mario Necsulescu.
    - Progettisti: Tutto il gruppo.
    - Verificatori: Filippo Guerra, Davide Lorenzon.

Il gruppo ha inoltre concordato una mini-riunione informale di allineamento per venerdì mattina, aperta a tutti i membri disponibili, con l'obiettivo di verificare l'avanzamento dei task e redistribuire eventuali attività.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.22."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Adozione di PlantUML per diagrammi UML],
      [Velocizzare la produzione di diagrammi ],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Utilizzo della notazione UML 2.0],
      [Adottare lo standard più recente],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Diagramma delle classi suddiviso per package],
      [Migliorare leggibilità e manutenibilità della documentazione],
      [@st],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Valutazione dei design pattern applicabili],
      [Attività di ricerca utile per la  progettazione nel dettaglio],
      [@ds],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Pianificazione dello sprint 10],
      [Garantire copertura di tutti i ruoli necessari nella prossima iterazione],
      [@sprint],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Studio della vista dati],
      [Attività necessaria a delineare la struttura del sistema di permanenza dei dati],
      [@sprint],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.26."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [Redigere il verbale interno della riunione svoltasi il 2026-04-13],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [Scrivere la sezione Design Pattern nella Specifica Tecnica],
      [VI.22.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [Redigere la vista dati (persistenza MongoDB) nella Specifica Tecnica],
      [VI.22.6],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT,\ #persone.FILIPPO],
      [Aggiornare il Piano di Progetto (Sprint 9 e 10)],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO, \ #persone.DT],
      [Studiare e avviare la progettazione del diagramma delle classi per i moduli della Specifica Tecnica],
      [VI.22.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Tutto il gruppo],
      [Aggiornare il glossario con i nuovi termini introdotti nella Specifica Tecnica],
      [-],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]
