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

#let giornoRiunione = datetime(year: 2026, month: 03, day: 24)
#let doctype = "Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages("Stato del documento", doctype, giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: (persone.DT,),
    verificatori: (persone.FILIPPO,),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", doctype, giornoRiunione)[

  #let modifiche = (
    ([0.1.0], [2026-03-24], persone.DT, persone.FILIPPO, [Stesura del verbale]),
    ([1.0.0], [2026-03-25], persone.DT, persone.DT, [Approvazione finale]),
  )

  #registroModifiche(modifiche)
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
  - *Ora inizio*: 09:40
  - *Ora fine*: 11:43
  - *Scriba*: #persone.ANA
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Ana Maria Draghici
      - Davide Lorenzon
      - Davide Testolin
      - Felician Mario Necsulescu
      - Filippo Guerra
      \
    ]
]


#insertArabicNumberedPages("Ordine del giorno", "Verbale interno", giornoRiunione)[
  = Ordine del giorno
  - Confronto sulla presentazione RTB con il Prof. Cardin.
  - Retrospettiva.
  - Pianificazione dello Sprint.
]


#insertArabicNumberedPages("Riassunto della riunione", "Verbale interno", giornoRiunione)[
  = Riassunto della riunione
  La riunione si è svolta a seguito della presentazione RTB con il Prof. Cardin. Si è discusso sia della presentazione, sia dello sprint corrente (attraverso la retrospettiva) e futuro (con la pianificazione dei ruoli).

  = Retrospettiva

  + Sviluppo del Proof of Concept
  + Correzione dello script per generare il sito web della documentazione
  + Presentazione del Proof of Concept
  + Glossario: aggiunti nuovi termini
  + Norme di Progetto: introdotte le strategie di testing

  = Argomenti principali

  == Confronto sulla presentazione RTB con il Prof. Cardin <cardin>
  Sono stati analizzati i consigli dati dal Prof. Cardin durante la presentazione della Requirement and Technology Baseline. Nello specifico è stato considerato di implementare altre tecnologie sia per il backend (fastapi in sostituzione a Flask), sia per il frontend (con framework come React o Svelte), in modo da migliorare l'architettura e rendere l'applicazione più manutenibile.
  Alla fine è stato deciso di mantenere le tecnologie scelte, considerando anche il tempo rimanente in vista della data di consegna finale del progetto.

  == Pianificazione dello Sprint
  Aldo Bettega è stato nominato responsabile del prossimo sprint. È stato deciso inoltre di nominare due amministratori e due verificatori per far fronte agli ultimi documenti rimasti da verificare. Infine è stato nominato un solo analista che entrerà in azione a seguito della risposta (semaforo verde o rosso) del Prof. Cardin.
]


#insertArabicNumberedPages("Decisioni", "Verbale interno", giornoRiunione)[
  = Decisioni
  #let contatoreDecisioni = counter("decisioni")
  #contatoreDecisioni.update(1)
  #let prefisso = "VI.18."

  #let decisioni = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Redigere il verbale interno del 2026-03-24],
      [Il verbale deve essere disponibile a tutti i membri del gruppo prima del merge su `main`],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreDecisioni)],
      [Mantenere lo stack tecnologico corrente],
      [A seguito di diverse considerazioni il gruppo ha scelto di mantenere lo stack tecnologico corrente e di non introdurre ulteriori tecnologie],
      [@cardin],
    ),
  )

  #utilityTable(decisioni, header: ("Codice", "Descrizione", "Motivazioni", "Ref."), columns: (auto, 2fr, 2fr, auto))
]


#insertArabicNumberedPages("TODO", "Verbale interno", giornoRiunione)[

  = TODO

  #let prefisso = "TD.22."
  #let contatoreTodo = counter("todo")
  #contatoreTodo.update(1)
  I TODO sorti da questa riunione sono i seguenti:

  #let TODO = (
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.DT],
      [Redazione di questo verbale],
      [VI.18.1],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [Revisione Norme di Progetto],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [Revisione Piano di Progetto],
      [-],
    ),
    (
      [#getCode(prefisso: prefisso, contatore: contatoreTodo)],
      [#persone.FELIX],
      [Revisione Piano di Qualifica],
      [-],
    ),
  )
  #utilityTable(
    TODO,
    header: ("Codice", "Assegnatari", "Task", "Decisione di riferimento"),
    columns: (auto, auto, 1fr, auto),
  )

]
