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

// Info documento
#let currentVersion = (
  major: 0,
  minor: 1,
  patch: 0,
)

#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>

#let giornoRiunione = datetime(year: 2026, month: 05, day: 18)
#let doctype = "Verbale interno"

#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In verifica",
    versione: versionNumber,
    autori: (persone.FILIPPO,),
    verificatori: ("-"),
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
  - *Motivazione*: Riunione di fine sprint
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Discord
  - *Ora inizio*: 11.00
  - *Ora fine*: 12.10
  - *Scriba*: Filippo Guerra
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

  - Retrospettiva dello sprint e redicontazione delle ore.
  - Pianificazione delle approvazioni dei documenti e dei merge su develop.
  - Discussione problemi tecnici riscontrati.
  - Chiarimento sulla gestione dello standard nel processo di import.
  
]

#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione

  La riunione ha avuto inizio con un aggiornamento individuale sulle attività completate durante lo sprint, dove ogni membro ha illustrato i propri contributi.
  Si è poi parlato della distribuzione della modifica, verifica e approvazione dei documenti in vista della riunione di PB con il professor Cardin. 
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Pecifica Tecnica <st>

  È stato deciso di aggiornare la sezione sulla gestione degli errori,
  rimuovere le sezioni non utilizzate, pulire i pattern, i diagrammi di attività e
  sequenza e le tecnologie. Inoltre sarà necessario occuparsi dell'aggiornamento della parte frontend.
  
  = Norme di Progetto <ndp>
  È necessario spostare il ciclo PDCA nella posizione corretta.

  = Piano di Progetto <pdp>
  Il documento verrà aggiornato con i dati dello sprint 14; è prevista inoltre una verifica di tutti gli sprint precedenti e una
   revisione della sezione relativa al lungo termine.  

  = Piano di Qualifica <pdq>
  Per quanto riguarda il documento Piano di Qualifica, il gruppo ha deciso che è necessaria una 
  revisione delle metriche ,con rimozione di quelle relative al frontend. 
  È stato anche deciso di aggiornare il documento con il nuovo file di test di inclusione e la sezione relativa ai test di frontend. 
  
  = Analisi dei Requisiti <adr>
  È stato deciso di rimuovere la precondizione di sessione dalle schermate lista dispositivi e dettaglio dispositivi.
]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni

  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.28."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Merge su develop per i documenti approvati],
      [Garantire che su develop siano presenti solo documenti valutati e approvati],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Contattare Cardin per fissare la riunione di PB],
      [Presentazione della prima parte della PB],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Preparare presentazione per Vardanega],
      [Scrivere la presentazione per la seconda parte della PB],
      [-],
    ),

  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]

#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[
  = TODO

  #let prefisso = "TD.33."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)

  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [PDP: tenere aggiornato (Sprint 14); \
      PDQ: aggiornare con il nuovo file di test; \
      NDP: approvazione e merge su develop],
      [],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [ST: aggiornare sezione gestione errori, rimuovere sezioni non usate, pulizia pattern, pulizia diagrammi attività-sequenza, pulizia tecnologie;],
      [],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ALDO],
      [Preparare presentazione per riunione con Cardin],
      [],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.ANA],
      [NDP: spostare ciclo PDCA;\
       PDP: rivedere sezione lungo termine;\ 
       PDQ: test di frontend, aggiornare metriche precedenti; 
       MU: approvazione e merge su develop],
      [],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DL],
      [ST: aggiornare parte del frontend],
      [],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [PDQ: rivedere metriche (rimuovere metriche di frontend)],
      [],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [ADR: rimuovere precondizione sessione da lista dispositivi e dettaglio dispositivi;\
       verifica verbali interno ed esterno 2026-05-18],
      [],
    ),
  )

  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )
]