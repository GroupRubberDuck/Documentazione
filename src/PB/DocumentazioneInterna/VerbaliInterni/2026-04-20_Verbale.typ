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
  major: 0,
  minor: 1,
  patch: 0,
)
//converte dizionario in stringa
#let versionNumber = currentVersion.values().map(n => { str(n) }).join(".")
#metadata(versionNumber)<versionNumber>
#let giornoRiunione = datetime(year: 2026, month: 04, day: 20)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "In lavorazione",
    versione: versionNumber,
    autori: (persone.DT,),
    verificatori: (),
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
  - *Ora fine*: 16.00
  - *Scriba*: #persone.DT
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
  - Retrospettiva dello Sprint 10.
  - Aggiornamento sullo stato della Specifica Tecnica (ST).
  - Definizione dei ruoli e assegnazione dei task per lo Sprint 11.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione
  La riunione è iniziata con la retrospettiva dello Sprint 10, durante la quale ciascun membro ha rendicontato le attività svolte e le relative ore per ruolo. Il team ha poi discusso l'avanzamento del documento di Specifica Tecnica.
]

#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Specifica Tecnica <st>
  Sono state completate le sezioni schema dati e design pattern, mentre sono stati inserirti nuovi diagrammi nella sezione diagramma delle classi.

  = Pianificazione Sprint 11  <sprint>
  Lo Sprint 11 è stato definito dal 21 aprile al 27 aprile 2026. La riunione di chiusura sprint è stata fissata per lunedì 27 aprile alle ore 15.00. I ruoli assegnati per lo sprint sono i seguenti:

  - Responsabile — Ana Maria Draghici;
  - Amministratore — Filippo Guerra, Davide Testolin;
  - Progettisti — tutto il gruppo.

  = Codifica <codifica>
  E' stato deciso di iniziare la fase di codifica, assegnata ai due amministratori Davide Testolin e Filippo Guerra. Inizialmente dovranno impostare l'ambiente di sviluppo per il Minimum Viable Product (MVP) e successivamente iniziare la codifica del dominio.

  = Incontro con il Prof. Cardin
  E' stato deciso di richiedere al Prof. Cardin un incontro per risolvere alcuni dubbi del gruppo.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.24."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Iniziare la codifica],
      [Creare le basi per l'MVP],
      [@codifica],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.28."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [Redigere il verbale interno di questa riunione],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO],
      [Definire i metodi di nomenclatura di classi, funzioni e variabili],
      [VI.24.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [Impostare l'ambiente di sviluppo per l'MVP],
      [VI.24.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FILIPPO, \ #persone.DT],
      [Iniziare l'attività di codifica del dominio],
      [VI.24.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [],
      [Stesura delle domande per il Prof. Cardin],
      [-],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]
