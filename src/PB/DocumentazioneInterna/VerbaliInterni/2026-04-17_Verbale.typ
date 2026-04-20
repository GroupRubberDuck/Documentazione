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
#let giornoRiunione = datetime(year: 2026, month: 04, day: 17)
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
  - *Ora inizio*: 9.00
  - *Ora fine*: 10.06
  - *Scriba*: #persone.DT
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Testolin
      - Filippo Guerra
      - Ana Maria Draghici
      - Davide Lorenzon
      \
    ]
]

#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Retrospettiva di metà Sprint 10.
  
]


#insertArabicNumberedPages("Contenuto riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della Riunione
  Nella riunione si è discusso principalmente sul progresso dello sprint corrente attraverso la retrospettiva, in particolare sul progresso del documento Specifica Tecnica.

  = Merge al termine degli sprint <merge>
  E' stato chiarito che al termine di ogni sprint è compito dell'amministratore effettuare il merge dal branch develop al main. Inoltre è stata chiarita la procedura di merge dai branch dedicati ai singoli file (o gruppi di file come i verbali): fatto il merge con main solo una volta che il file si trovi completamente verificato. In questo modo tutti i documenti sul branch main sono completamente verificati e pronti per essere mergati sul branch main.

  = Divisione del diagramma delle classi <divisione>
  E' stato deciso di dividere il diagramma delle classi per aree logiche, ad esempio per la sezione dispositivo ci sono la parte inbound del dispositivo, la classe dispositivo della porta e la classe dispositivo del core.

]

#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.23."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Merge dal branch develop a main al termine di ogni sprint],
      [Rendere disponibili tutti i documenti e le modifiche apportate durante lo sprint a tutti],
      [@merge],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Divisione del diagramma delle classi in aree logiche],
      [Velocizzare la progettazione],
      [@divisione],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Lingua inglese per la nomenclatura delle classi],
      [Uniformare la nomenclatura del codice],
      [-],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]



#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.27."
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
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]
