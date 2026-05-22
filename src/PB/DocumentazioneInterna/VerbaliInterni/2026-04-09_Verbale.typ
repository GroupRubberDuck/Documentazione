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


//
//Info del documento
//
#let currentVersion = (
  major: 1,
  minor: 0,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>
#let giornoRiunione = datetime(year: 2026, month: 04, day: 09)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.FILIPPO,),
    verificatori: (persone.ALDO,),
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
  - *Motivazione*: Riunione di metà sprint
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 18.00
  - *Ora fine*: 18.30
  - *Scriba*: #persone.FILIPPO
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      - Ana Maria Draghici
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Revisione dell'avanzamento del documento Specifica Tecnica.
  - Discussione sui design pattern da adottare.
  - Avvio della stesura del Manuale Utente.
  - Aggiornamento del documento Piano di Progetto con sprint 8 e incorporazione dei miglioramenti suggeriti dal professor Vardanega.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione
  La riunione ha avuto come obiettivo principale l’allineamento sull’avanzamento del documento di  Specifica Tecnica e la pianificazione delle attività del prossimo sprint. Il team ha discusso lo stato dell’architettura di sistema (esagonale), concordando di procedere con la progettazione di dettaglio a partire dallo sprint successivo (sprint 9). Si è discusso anche sull'avvio della scrittura del Manuale Utente e sull’aggiornamento del PdP.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Avanzamento Specifica Tecnica <spec>
  Il team ha riassunto lo stato attuale della Specifica Tecnica.
  La sezione di architettura di sistema è stata strutturata nei seguenti paragrafi: architettura generale, architettura logica (con descrizione del pattern esagonale e relativi pro e contro) e un diagramma dei package da rifinire.
  Il team ha concordato che le motivazioni alla base della scelta dell’architettura esagonale sono: testabilità del core, sviluppo parallelo tramite porte e adattatori, separazione del nucleo applicativo e inversione delle dipendenze. Come limiti sono stati rilevati una curva di apprendimento ripida e un overhead iniziale di configurazione.
  A partire dal prossimo sprint si prevede di avviare la progettazione di dettaglio (sezioni 4 e 5 del documento: design pattern e diagrammi delle classi), che rappresenta la parte più corposa della Specifica Tecnica.

  = Design Pattern e Progettazione<design>
  Il team ha discusso i design pattern da adottare. I pattern identificati come necessari sono:
  - Strategy: per la gestione di file di formati diversi (CSV, XML, ecc.).
  - Observer: per monitorare gli aggiornamenti dei requisiti e le relative dipendenze nella core logic. Vue.js integra nativamente questo pattern tramite data binding reattivo.
  - Adapter: per l’integrazione tra porte e adattatori nell’architettura esagonale.
  Le sezioni 4 (design pattern) e 5 (diagrammi delle classi) sono prioritarie e costituiscono la parte più importante del documento.

  = Manuale Utente <man>
  Il team ha avviato la discussione sull’impostazione del Manuale Utente.
  Da alcune analisi è emerso che il documento è rivolto all’utente finale e deve includere: introduzione e descrizione delle funzionalità principali, requisiti hardware e software, istruzioni di installazione e guide operative per le azioni principali dell’applicazione.
  In questa fase iniziale si procederà con la stesura dell’introduzione e della sezione di installazione, rimandando le guide operative alla disponibilità dell’applicazione.

  = Aggiornamento PDP <doc>
  Il team ha stabilito di aggiornare il Piano di Progetto con la consuntivazione dello sprint 8 e di incorporare, a partire dallo sprint 9, i miglioramenti suggeriti dal Professor Tullio Vardanega in merito alla struttura della sezione di analisi dei rischi.
  È stata valutata non necessaria la correzione retroattiva degli sprint precedenti. È stato anche deciso che, negli sprint futuri, tutti i task passeranno per lo stato “In approvazione” prima di essere spostati in “Done” a fine sprint, in modo da facilitare la retrospettiva.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.21."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Avvio progettazione di dettaglio nel prossimo sprint],
      [Avanzare nella stesura di Specifica Tecnica],
      [@spec],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Adottare i pattern Strategy, Observer, Command e Adapter],
      [Coprono i principali scenari applicativi identificati],
      [@design],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Avviare la stesura del Manuale Utente],
      [Iniziare a scrivere le parti realizzabili senza l'applicazione completa],
      [@man],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Aggiornare PDP con sprint 8 e miglioramenti consigliati dal professor Vardanega],
      [Allineamento documentazione e recepimento feedback docente],
      [@doc],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Usare stato ‘In approvazione’ prima di Done negli sprint futuri],
      [Facilitare retrospettiva e approvazione responsabile],
      [@doc],
    ),
   (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Affinare la bozza di architettura stesa in Specifica Tecnica],
      [Completare il paragrafo di architettura logica],
      [@spec],
    ), 
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.25."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [Redigere il verbale interno della riunione svoltasi il 2026-04-09],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Migliorare la sezione architettura logica nella Specifica Tecnica],
      [VI.21.6],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX,\ #persone.ANA],
      [Studio e stesura sezione design pattern (ST)],
      [VI.21.2],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT,\ #persone.FILIPPO],
      [Stesura introduzione e sezione installazione Manuale Utente],
      [VI.21.3],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Aggiornare PDP sprint 8 con struttura suggerita da Tullio],
      [VI.21.4],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [Tutto il gruppo],
      [Studio diagramma delle classi per avvio stesura entro martedì],
      [VI.21.1],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]
