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
#let giornoRiunione = datetime(year: 2026, month: 04, day: 20)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.DT,),
    verificatori: ("Felician Mario Necsulescu",),
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
  Sono state completate le sezioni schema dati e design pattern, mentre sono stati inserirti nuovi diagrammi nella sezione diagramma delle classi. In particolare, sono stati formalizzati i pattern creazionali, strutturali e comportamentali necessari a garantire il disaccoppiamento previsto dall’Architettura Esagonale. Parallelamente, la sezione dedicata ai diagrammi delle classi è stata aggiornata con nuovi schemi granulari, suddivisi per aree logiche, per facilitare la comprensione delle interazioni tra le componenti inbound, le porte e il core.

  = Pianificazione Sprint 11  <sprint>
  Lo Sprint 11 è stato definito dal 21 aprile al 27 aprile 2026. La riunione di chiusura sprint è stata fissata per lunedì 27 aprile alle ore 15.00. I ruoli assegnati per lo sprint sono i seguenti:

  - Responsabile — Ana Maria Draghici;
  - Amministratore — Filippo Guerra, Davide Testolin;
  - Verificatori — Felician Mario Necsulescu;
  - Progettisti — tutto il gruppo.

  = Codifica <codifica>
  E' stato deciso di iniziare la fase di codifica, assegnata ai due amministratori Davide Testolin e Filippo Guerra. Inizialmente dovranno impostare l'ambiente di sviluppo per il Minimum Viable Product (MVP) e successivamente iniziare la codifica del dominio.

  = Incontro con il Prof. Cardin
  A seguito di un'analisi interna delle criticità residue, il gruppo ha deciso di richiedere un incontro di chiarimento al Prof. Cardin. L'obiettivo è sottoporre al docente alcuni dubbi specifici riguardanti le scelte architetturali e l’applicazione dei pattern, al fine di validare la direzione intrapresa prima di procedere massivamente con la codifica.
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
      [Tutto il gruppo],
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
